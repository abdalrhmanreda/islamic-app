class HijriEvent {
  final String name;
  final String description;
  final String date;
  final int monthNumber; // Add month number

  HijriEvent({
    required this.name,
    required this.description,
    required this.date,
    required this.monthNumber, // Add month number
  });

  factory HijriEvent.fromJson(Map<String, dynamic> json) {
    return HijriEvent(
      name: json['name'],
      description: json['description'],
      date: json['date'],
      monthNumber: json['monthNumber'], // Add month number
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'date': date,
      'monthNumber': monthNumber, // Add month number
    };
  }
}
