class Station {
  final String stationId;
  final String name;
  final double lat;
  final double lon;

  Station({
    required this.stationId,
    required this.name,
    required this.lat,
    required this.lon,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationId: json['station_id'],
      name: json['name'],
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }
}
