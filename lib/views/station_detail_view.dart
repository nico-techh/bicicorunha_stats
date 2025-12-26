import 'package:flutter/material.dart';
import '../models/station.dart';
import '../models/station_status.dart';
import '../viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';

class StationDetailView extends StatelessWidget {
  final Station station;

  StationDetailView({required this.station});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final status = vm.statusForStation(station.stationId);

    return Scaffold(
      appBar: AppBar(title: Text(station.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ubicación: ${station.address}'),
            SizedBox(height: 8),
            Text('Última actualización: ${status?.lastUpdated.toLocal().toString() ?? 'Desconocida'}'),
            SizedBox(height: 8),
            Text('Bicis disponibles: ${status?.numBikesAvailable ?? 0}'),
            Text('e-Bikes disponibles: ${status?.numEBikesAvailable ?? 0}'),
            Text('Anclajes libres: ${status?.numDocksAvailable ?? 0}'),
            SizedBox(height: 16),
            Text(vm.decisionText(status), style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
