class StationStatus {
  final String stationId;
  final int numBikesAvailable;
  final int numDocksAvailable;
  final DateTime lastUpdated;

  StationStatus({
    required this.stationId,
    required this.numBikesAvailable,
    required this.numDocksAvailable,
    required this.lastUpdated,
  });

  factory StationStatus.fromJson(Map<String, dynamic> json) {
    return StationStatus(
      stationId: json['station_id'],
      numBikesAvailable: json['num_bikes_available'],
      numDocksAvailable: json['num_docks_available'],
      lastUpdated:
          DateTime.fromMillisecondsSinceEpoch(json['last_reported'] * 1000),
    );
  }
}
