import 'package:alleventsapp/models/api_model.dart';
import 'package:flutter/material.dart';
import 'event_details_screen.dart';
class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(event: event),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: event.bannerUrl == ""
                  ? const Center(
                  child: Icon(
                    Icons.picture_in_picture_alt,
                    size: 100,
                    color: Colors.red,
                  ))
                  : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        event.bannerUrl,

                      )),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                event.eventName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  overflow:
                  TextOverflow.ellipsis,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
