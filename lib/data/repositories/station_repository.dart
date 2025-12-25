import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/station.dart';
import '../models/station_status.dart';

class StationRepository {
  static const String _baseUrl =
      'https://gbfs.nextbike.net/maps/gbfs/v2/nextbike_la_coruna/es';

  Future<List<Station>> fetchStations() async {
    final url = Uri.parse('$_baseUrl/station_information.json');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error cargando estaciones');
    }

    final data = json.decode(response.body);
    final stationsJson = data['data']['stations'] as List;

    return stationsJson
        .map((json) => Station.fromJson(json))
        .toList();
  }

  Future<List<StationStatus>> fetchStationStatus() async {
    final url = Uri.parse('$_baseUrl/station_status.json');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error cargando estado de estaciones');
    }

    final data = json.decode(response.body);
    final statusJson = data['data']['stations'] as List;

    return statusJson
        .map((json) => StationStatus.fromJson(json))
        .toList();
  }
}
