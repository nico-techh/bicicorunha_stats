import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/station.dart';
import '../models/station_status.dart';

class StationRepository {
  final String infoUrl =
      'https://acoruna.publicbikesystem.net/customer/gbfs/v2/gl/station_information';
  final String statusUrl =
      'https://acoruna.publicbikesystem.net/customer/gbfs/v2/gl/station_status';

  Future<List<Station>> fetchStations() async {
    final response = await http.get(Uri.parse(infoUrl));
    final data = json.decode(response.body)['data']['stations'] as List;
    return data.map((s) => Station.fromJson(s)).toList();
  }

  Future<List<StationStatus>> fetchStatus() async {
    final response = await http.get(Uri.parse(statusUrl));
    final data = json.decode(response.body)['data']['stations'] as List;
    return data.map((s) => StationStatus.fromJson(s)).toList();
  }
}
