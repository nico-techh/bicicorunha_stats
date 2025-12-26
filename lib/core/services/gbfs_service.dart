import 'dart:async';
import '../../data/models/station.dart';
import '../../data/models/station_status.dart';

class GbfsService {
  Future<List<Station>> fetchStations() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Station(
        stationId: '1',
        name: 'Plaza de Pontevedra',
        lat: 43.3711,
        lon: -8.3960,
      ),
      Station(
        stationId: '2',
        name: 'Riazor',
        lat: 43.3684,
        lon: -8.4173,
      ),
      Station(
        stationId: '3',
        name: 'Cuatro Caminos',
        lat: 43.3623,
        lon: -8.4056,
      ),
    ];
  }

  Future<List<StationStatus>> fetchStationStatus() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      StationStatus(
        stationId: '1',
        numBikesAvailable: 5,
        numEbikesAvailable: 2,
        numDocksAvailable: 10,
        lastReported: DateTime.now(),
      ),
      StationStatus(
        stationId: '2',
        numBikesAvailable: 0,
        numEbikesAvailable: 0,
        numDocksAvailable: 15,
        lastReported: DateTime.now(),
      ),
      StationStatus(
        stationId: '3',
        numBikesAvailable: 3,
        numEbikesAvailable: 0,
        numDocksAvailable: 8,
        lastReported: DateTime.now(),
      ),
    ];
  }
}
