class Station {
  final String stationId;
  final String name;
  final String address;

  Station({required this.stationId, required this.name, required this.address});

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationId: json['station_id'],
      name: json['name'],
      address: json['address'] ?? 'No disponible',
    );
  }
}
