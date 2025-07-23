import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SmartPhoneChart2 extends StatelessWidget {
  const SmartPhoneChart2({super.key});

  // Data from provided JSON, adapted from SmartPhoneChart structure
  static const List<int> years = [2020, 2021, 2022, 2023, 2024, 2025];
  static const List<double> androidDownloads = [100, 120, 140, 150, 160, 170];
  static const List<double> iosDownloads = [35, 38, 40, 35.4, 34.9, 36];
  static const List<double> androidRevenue = [38.6, 45, 55, 65, 78, 85];
  static const List<double> iosRevenue = [72.4, 85, 100, 120, 123, 138];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Column(
        children: [
          Expanded(
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      String label;
                      switch (rodIndex) {
                        case 0:
                          label =
                              'Android Downloads: ${rod.toY.toStringAsFixed(1)} tỷ';
                          break;
                        case 1:
                          label =
                              'iOS Downloads: ${rod.toY.toStringAsFixed(1)} tỷ';
                          break;
                        case 2:
                          label =
                              'Android Revenue: ${rod.toY.toStringAsFixed(1)} tỷ USD';
                          break;
                        case 3:
                          label =
                              'iOS Revenue: ${rod.toY.toStringAsFixed(1)} tỷ USD';
                          break;
                        default:
                          label = '';
                      }
                      return BarTooltipItem(
                        label,
                        TextStyle(
                          color: rod.color ?? Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.white.withOpacity(0.2),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.white.withOpacity(0.2),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      interval: 1,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d)),
                ),
                minY: 0,
                maxY: 180,
                barGroups:
                    years.asMap().entries.map((e) {
                      final index = e.key;
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: androidDownloads[index],
                            color: Colors.green,
                            width: 10,
                          ),
                          BarChartRodData(
                            toY: iosDownloads[index],
                            color: Colors.blue,
                            width: 10,
                          ),
                          BarChartRodData(
                            toY: androidRevenue[index],
                            color: Colors.lightGreen,
                            width: 10,
                          ),
                          BarChartRodData(
                            toY: iosRevenue[index],
                            color: Colors.lightBlue,
                            width: 10,
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              _Legend(color: Colors.green, text: 'Android Downloads'),
              _Legend(color: Colors.blue, text: 'iOS Downloads'),
              _Legend(color: Colors.lightGreen, text: 'Android Revenue'),
              _Legend(color: Colors.lightBlue, text: 'iOS Revenue'),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.white,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text((2020 + value.toInt()).toString(), style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    );
    if (value > meta.max) return Container();
    return Text(
      value.toInt().toString(),
      style: style,
      textAlign: TextAlign.left,
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String text;

  const _Legend({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
