import 'package:alleventsapp/constants/sizes.dart';
import 'package:alleventsapp/models/details_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event_Details_Model event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.eventNameRaw),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: event.bannerUrl.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          event.bannerUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            );
                          },
                        ),
                      )
                    : const Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      ),
              ),
              const SizedBox(height: 16),
              Text(
                event.eventNameRaw,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: TSpaces.defaultSpace),
              const Text(
                "Highlights",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: TSpaces.defaultSpace),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.auto_graph_sharp,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Featured in ${event.venue.city}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.edit_calendar,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    event.startTimeDisplay,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      event.location,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSpaces.defaultSpace),
              const Text(
                "About",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: TSpaces.defaultSpace),
              Wrap(
                spacing: 8,
                children: event.categories
                    .map((category) => Chip(label: Text(category)))
                    .toList(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      event.location,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                event.venue.street,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                event.venue.fullAddress,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: TSpaces.defaultSpace),
              const Text(
                "Date & Time",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: TSpaces.defaultSpace),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      event.startTimeDisplay,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSpaces.defaultSpace),
              const Text(
                "Location",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: TSpaces.defaultSpace),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      event.location,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    onPressed: () {
                      launchUrl(Uri.parse(event.eventUrl));
                    },
                    child: const Text(
                      "View Details Online",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
