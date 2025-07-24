import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SmartPhoneChart3 extends StatelessWidget {
  const SmartPhoneChart3({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4,
      child: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(color: Colors.white),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white,
                ),
                labelRotation: -45,
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(color: Colors.white),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
                labelFormat: '{value}%',
                minimum: 0,
                maximum: 100,
                interval: 20,
              ),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                textStyle: const TextStyle(color: Colors.white, fontSize: 32),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,

                builder: (
                  dynamic data,
                  dynamic point,
                  dynamic series,
                  int pointIndex,
                  int seriesIndex,
                ) {
                  final chartData = _getChartData()[pointIndex];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chartData.period,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Android: ${chartData.android.toStringAsFixed(1)}%',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'iOS: ${chartData.ios.toStringAsFixed(1)}%',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 24,
                          ),
                        ),
                        if (chartData.symbian > 0)
                          Text(
                            'Symbian: ${chartData.symbian.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                            ),
                          ),
                        if (chartData.windows > 0)
                          Text(
                            'Windows: ${chartData.windows.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              color: Colors.yellow,
                              fontSize: 24,
                            ),
                          ),
                        if (chartData.blackBerry > 0)
                          Text(
                            'BlackBerry: ${chartData.blackBerry.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 24,
                            ),
                          ),
                        if (chartData.other > 0)
                          Text(
                            'Other: ${chartData.other.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                          ),
                        if (chartData.harmonyOS > 0)
                          Text(
                            'HarmonyOS: ${chartData.harmonyOS.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              color: Colors.teal,
                              fontSize: 24,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              series: <CartesianSeries>[
                // Android
                StackedArea100Series<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.period,
                  yValueMapper: (ChartData data, _) => data.android,
                  name: 'Android',
                  color: Colors.green,
                  opacity: 0.8,
                  animationDuration: 1000,
                  animationDelay: 0,
                  markerSettings: MarkerSettings(isVisible: true),
                ),
                // iOS
                StackedArea100Series<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.period,
                  yValueMapper: (ChartData data, _) => data.ios,
                  name: 'iOS',
                  color: Colors.blue,
                  opacity: 0.8,
                  animationDuration: 1000,
                  animationDelay: 200,
                  markerSettings: MarkerSettings(isVisible: true),
                ),
                // Symbian
                StackedArea100Series<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.period,
                  yValueMapper: (ChartData data, _) => data.symbian,
                  name: 'Symbian',
                  color: Colors.orange,
                  opacity: 0.8,
                  animationDuration: 1000,
                  animationDelay: 400,
                  markerSettings: MarkerSettings(isVisible: true),
                ),
                // Windows
                StackedArea100Series<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.period,
                  yValueMapper: (ChartData data, _) => data.windows,
                  name: 'Windows',
                  color: Colors.yellow,
                  opacity: 0.8,
                  animationDuration: 1000,
                  animationDelay: 600,
                  markerSettings: MarkerSettings(isVisible: true),
                ),
                // BlackBerry
                StackedArea100Series<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.period,
                  yValueMapper: (ChartData data, _) => data.blackBerry,
                  name: 'BlackBerry',
                  color: Colors.red,
                  opacity: 0.8,
                  animationDuration: 1000,
                  animationDelay: 800,
                  markerSettings: MarkerSettings(isVisible: true),
                ),
                // Other
                StackedArea100Series<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.period,
                  yValueMapper: (ChartData data, _) => data.other,
                  name: 'Other',
                  color: Colors.grey,
                  opacity: 0.8,
                  animationDuration: 1000,
                  animationDelay: 1000,
                  markerSettings: MarkerSettings(isVisible: true),
                ),
                // HarmonyOS
                StackedArea100Series<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.period,
                  yValueMapper: (ChartData data, _) => data.harmonyOS,
                  name: 'HarmonyOS',
                  color: Colors.teal,
                  opacity: 0.8,
                  animationDuration: 1000,
                  animationDelay: 1200,
                  markerSettings: MarkerSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ChartData> _getChartData() {
    return [
      ChartData('2009', 2, 34, 35, 2, 8, 19, 0),
      ChartData('2010', 9, 25, 32, 0, 17, 17, 0),
      ChartData('2011', 19, 22, 32, 1, 12, 14, 0),
      ChartData('2012', 27, 24, 29, 0, 5, 15, 0),
      ChartData('2013', 39, 24, 20, 2, 4, 11, 0),
      ChartData('2014', 54, 24, 11, 2, 2, 7, 0),
      ChartData('2015', 64, 20, 0, 2, 1, 7, 0),
      ChartData('2016', 69, 19, 0, 2, 1, 9, 0),
      ChartData('2017', 73, 20, 0, 1, 0, 6, 0),
      ChartData('2018', 75, 20, 0, 0, 0, 5, 0),
      ChartData('2019', 75, 23, 0, 0, 0, 2, 0),
      ChartData('2020', 73, 26, 0, 0, 0, 1, 0),
      ChartData('2021', 81, 18, 0, 0, 0, 0, 1),
      ChartData('2022', 80, 18, 0, 0, 0, 0, 2),
      ChartData('2023', 78, 19, 0, 0, 0, 0, 3),
      ChartData('2024', 78, 18, 0, 0, 0, 0, 4),
      ChartData('2025', 76, 19, 0, 0, 0, 0, 5),
    ];
  }
}

class ChartData {
  ChartData(
    this.period,
    this.android,
    this.ios,
    this.symbian,
    this.windows,
    this.blackBerry,
    this.other,
    this.harmonyOS,
  );

  final String period;
  final double android;
  final double ios;
  final double symbian;
  final double windows;
  final double blackBerry;
  final double other;
  final double harmonyOS;
}
