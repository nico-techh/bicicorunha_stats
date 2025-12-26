import 'package:flutter/material.dart';
import '../models/station.dart';
import '../models/station_status.dart';
import '../repositories/station_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final StationRepository _repository = StationRepository();

  List<Station> stations = [];
  List<StationStatus> status = [];
  Station? favoriteStation;

  Future<void> loadStations() async {
    stations = await _repository.fetchStations();
    status = await _repository.fetchStatus();
    notifyListeners();
  }

  void setFavorite(Station station) {
    favoriteStation = station;
    notifyListeners();
  }

  StationStatus? statusForStation(String stationId) {
    return status.firstWhere(
        (s) => s.stationId == stationId,
        orElse: () => StationStatus(
            stationId: stationId,
            numBikesAvailable: 0,
            numDocksAvailable: 0,
            lastUpdated: DateTime.now()));
  }
}
