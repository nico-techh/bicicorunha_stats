import 'station_information.dart';
import 'station_status.dart';

class Station {
  final StationInformation information;
  final StationStatus status;

  Station({
    required this.information,
    required this.status,
  });
}
