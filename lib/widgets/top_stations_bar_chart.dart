import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../data/models/station.dart';

class TopStationsBarChart extends StatelessWidget {
  final List<Station> stations;

  const TopStationsBarChart({
    super.key,
    required this.stations,
  });

  @override
  Widget build(BuildContext context) {
    final topStations = List<Station>.from(stations)
      ..sort(
        (a, b) =>
            b.status.ebikesAvailable.compareTo(a.status.ebikesAvailable),
      );

    final displayedStations = topStations.take(5).toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: displayedStations
                .map((s) => s.status.ebikesAvailable)
                .reduce((a, b) => a > b ? a : b)
                .toDouble() +
            1,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < displayedStations.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      index.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
        barGroups: displayedStations.asMap().entries.map((entry) {
          final index = entry.key;
          final station = entry.value;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: station.status.ebikesAvailable.toDouble(),
                width: 18,
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
