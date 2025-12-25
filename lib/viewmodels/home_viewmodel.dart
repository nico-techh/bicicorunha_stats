import 'package:flutter/material.dart';

import '../data/models/station.dart';
import '../data/models/station_status.dart';
import '../data/repositories/station_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final StationRepository _repository = StationRepository();

  List<Station> stations = [];
  List<StationStatus> status = [];

  bool isLoading = false;
  String? errorMessage;

  Future<void> loadData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      stations = await _repository.fetchStations();
      status = await _repository.fetchStationStatus();
    } catch (e) {
      errorMessage = 'Error cargando datos de Bici Coruña';
    }

    isLoading = false;
    notifyListeners();
  }

  /// Estación favorita (ejemplo: la primera)
  Station? get favoriteStation {
    if (stations.isEmpty) return null;
    return stations.first;
  }

  StationStatus? statusForStation(String stationId) {
    return status.firstWhere(
      (s) => s.stationId == stationId,
      orElse: () => StationStatus(
        stationId: stationId,
        bikesAvailable: 0,
        ebikesAvailable: 0,
        docksAvailable: 0,
        lastReported: 0,
      ),
    );
  }
}
