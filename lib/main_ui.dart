import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_models/api_model.dart';
import 'api_models/category_model.dart';
import 'main_screens/event_card_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Event>> eventsFuture;
  String selectedCategory = 'All';
  bool isGridView = true;
  bool isData = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<AllCategory> result = [];

  Future<void> getData() async {
    var url = "https://allevents.s3.amazonaws.com/tests/categories.json";

    try {
      final response = await http.get(
        Uri.parse(url),
      );
      print('response.statusCode');
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        var responseData1 = responseData;
        print('list---------------->$responseData');
        for (var coinJSON in responseData1) {
          result.add(AllCategory.fromJson(coinJSON));
        }
        setState(() {
          eventsFuture = fetchEvents(result[0].data.toString());
          isData = false;
        });
      }
    } catch (error) {
      rethrow;
    }
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  void _showListInBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300, // Set the height of the bottom sheet
          color: Colors.white,
          child: ListView.builder(
            itemCount: result.length, // Number of items in the list
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${capitalize(result[index].category.toString())}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      // Handle item tap
                      setState(() {
                        selectedCategory = '${result[index].category}';
                        eventsFuture =
                            fetchEvents(result[index].data.toString());

                        Navigator.pop(context); // Close the bottom sheet
                      });
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<List<Event>> fetchEvents(String apiUrl) async {
    try {
      // Make the HTTP GET request
      final response = await http.get(Uri.parse(apiUrl));

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Extract the list of events from the JSON data
        final List eventsJson = jsonData['item'];

        // Map the list of events to the Event model and return it
        return eventsJson.map((json) => Event.fromJson(json)).toList();
      } else {
        // Handle non-200 status codes
        throw Exception(
            'Failed to load events. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      throw Exception('Failed to load events: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        _showListInBottomSheet(context);
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(style: BorderStyle.solid),
                        ),
                        height: 50,
                        width: 150,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              capitalize(selectedCategory),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        )))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: IconButton(
                  icon:
                      Icon(size: 35, isGridView ? Icons.list : Icons.grid_view),
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                      // _showListInBottomSheet(context);
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
              child: isData == false
                  ? FutureBuilder<List<Event>>(
                      future: eventsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text('No events available.'));
                        }

                        final events = snapshot.data!;

                        if (isGridView) {
                          return GridView.builder(
                            padding: const EdgeInsets.all(8.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 1.3, // Square items
                            ),
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              final event = events[index];
                              return EventCard(event: event);
                            },
                          );
                        } else {
                          return ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 150,
                                child: Card(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                            height: 120,
                                            width: 180,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      events[index]
                                                          .bannerUrl
                                                          .toString()),
                                                  fit: BoxFit.cover,
                                                ))),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                events[index].eventName,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 22,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8.0),
                                                child: Text(
                                                  events[index].venue.city,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(events[index].label,
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16)),
                                                  const Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .star_border_outlined,
                                                        color: Colors.grey,
                                                      ),
                                                      Icon(
                                                        Icons.upload_outlined,
                                                        color: Colors.grey,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    )
                  : const Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
