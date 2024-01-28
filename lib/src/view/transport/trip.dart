
class Trip {
  String activityType;
  int distanceMeters;
  DateTime timestamp;

  Trip({required this.activityType, required this.distanceMeters, required this.timestamp});

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      activityType: json['activityType'] as String,
      distanceMeters: json['distanceMeters'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}
