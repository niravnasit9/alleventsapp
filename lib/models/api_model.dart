class Event {
  final String eventId;
  final String eventName;
  final String eventNameRaw;
  final String startTimeDisplay;
  final String endTimeDisplay;
  final String location;
  final Venue venue;
  final Tickets tickets;
  final List<String> categories;
  final List<String> tags;
  final String eventUrl;
  final String shareUrl;
  final String bannerUrl;
  final double score;
  final String label;
  final int featured;

  Event({
    required this.eventId,
    required this.eventName,
    required this.eventNameRaw,
    required this.startTimeDisplay,
    required this.endTimeDisplay,
    required this.location,
    required this.venue,
    required this.tickets,
    required this.categories,
    required this.tags,
    required this.eventUrl,
    required this.shareUrl,
    required this.bannerUrl,
    required this.score,
    required this.label,
    required this.featured,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['event_id'],
      eventName: json['eventname'],
      eventNameRaw: json['eventname_raw'],
      startTimeDisplay: json['start_time_display'],
      endTimeDisplay: json['end_time_display'],
      location: json['location'],
      venue: Venue.fromJson(json['venue']),
      tickets: Tickets.fromJson(json['tickets']),
      categories: List<String>.from(json['categories']),
      tags: List<String>.from(json['tags']),
      eventUrl: json['event_url'],
      shareUrl: json['share_url'],
      bannerUrl: json['banner_url'],
      score: json['score']?.toDouble() ?? 0.0,
      label: json['label'],
      featured: json['featured'],
    );
  }
}

class Venue {
  final String street;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;
  final String fullAddress;

  Venue({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.fullAddress,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
      fullAddress: json['full_address'] ?? '',
    );
  }
}

class Tickets {
  final bool hasTickets;
  final String ticketUrl;
  final String? ticketCurrency;
  final int? minTicketPrice;
  final int? maxTicketPrice;

  Tickets({
    required this.hasTickets,
    required this.ticketUrl,
    this.ticketCurrency,
    this.minTicketPrice,
    this.maxTicketPrice,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) {
    return Tickets(
      hasTickets: json['has_tickets'],
      ticketUrl: json['ticket_url'],
      ticketCurrency: json['ticket_currency'],
      minTicketPrice: json['min_ticket_price'],
      maxTicketPrice: json['max_ticket_price'],
    );
  }
}
