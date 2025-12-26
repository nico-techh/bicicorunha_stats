import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../viewmodels/home_viewmodel.dart';
import 'station_detail_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final favorite = vm.favoriteStation;

    return Scaffold(
      appBar: AppBar(title: const Text('BiciCoruña Stats')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (favorite != null) ...[
              Text('Estación favorita: ${favorite.name}'),
              SizedBox(height: 200, child: BikesChart(favoriteId: favorite.stationId)),
            ],
            Expanded(
              child: ListView.builder(
                itemCount: vm.stations.length,
                itemBuilder: (context, index) {
                  final station = vm.stations[index];
                  return Card(
                    color: Colors.green[100],
                    child: ListTile(
                      title: Text(station.name),
                      subtitle: Text(station.address),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite),
                        color: vm.favoriteStation == station ? Colors.red : null,
                        onPressed: () => vm.setFavorite(station),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StationDetailView(station: station),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BikesChart extends StatelessWidget {
  final String favoriteId;
  const BikesChart({super.key, required this.favoriteId});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final status = vm.statusForStation(favoriteId);
    final bikes = status?.numBikesAvailable.toDouble() ?? 0;
    final docks = status?.numDocksAvailable.toDouble() ?? 0;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: bikes, color: Colors.blue)]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: docks, color: Colors.orange)]),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                return Text(value.toInt() == 0 ? 'Bicis' : 'Anclajes');
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
      ),
    );
  }
}
