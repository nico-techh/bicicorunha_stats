class StationStatus {
  final String stationId;
  final int bikesAvailable;
  final int ebikesAvailable;
  final int docksAvailable;
  final int lastReported;

  StationStatus({
    required this.stationId,
    required this.bikesAvailable,
    required this.ebikesAvailable,
    required this.docksAvailable,
    required this.lastReported,
  });

  factory StationStatus.fromJson(Map<String, dynamic> json) {
    return StationStatus(
      stationId: json['station_id'],
      bikesAvailable: json['num_bikes_available'],
      ebikesAvailable: json['num_ebikes_available'],
      docksAvailable: json['num_docks_available'],
      lastReported: json['last_reported'],
    );
  }
}
