import 'package:alleventsapp/models/details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../event_screens/event_details_screen.dart';

class EventDetailCardList extends StatelessWidget {
  final Event_Details_Model event;

  const EventDetailCardList({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => EventDetailsScreen(event: event));
      },
      child: SizedBox(
        height: 150,
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: event.bannerUrl.isNotEmpty
                        ? DecorationImage(
                      image: NetworkImage(event.bannerUrl),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                  child: event.bannerUrl.isEmpty
                      ? const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  )
                      : null,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        event.eventName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          event.venue.city,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            event.label,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star_border_outlined,
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
      ),
    );
  }
}
