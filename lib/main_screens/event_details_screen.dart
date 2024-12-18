import 'package:alleventsapp/api_models/api_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.eventName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(event.bannerUrl, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                event.eventName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: "Location: ",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  children: [
                    TextSpan(
                      text: event.location,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),

              Text.rich(
                TextSpan(
                  text: "Time: ",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  children: [
                    TextSpan(
                      text: "${event.startTimeDisplay} - ${event.endTimeDisplay}",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: event.categories
                    .map((category) => Chip(label: Text(category)))
                    .toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  launchUrl(Uri.parse(event.eventUrl));
                },
                child: const Text("View Details Online",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
