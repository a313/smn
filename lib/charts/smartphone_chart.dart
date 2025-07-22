import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SmartPhoneChart extends StatelessWidget {
  SmartPhoneChart({super.key});

  final List<_ChartData> chartData = [
    _ChartData(2007, 122, 1.85),
    _ChartData(2008, 150, 2.25),
    _ChartData(2009, 180, 2.66),
    _ChartData(2010, 296, 4.33),
    _ChartData(2011, 472, 6.82),
    _ChartData(2012, 680, 9.71),
    _ChartData(2013, 970, 13.70),
    _ChartData(2014, 1000, 13.97),
    _ChartData(2015, 1210, 16.71),
    _ChartData(2016, 1420, 19.40),
    _ChartData(2017, 1650, 22.30),
    _ChartData(2018, 1950, 26.07),
    _ChartData(2019, 2280, 30.16),
    _ChartData(2020, 2660, 34.82),
    _ChartData(2021, 3020, 39.12),
    _ChartData(2022, 3610, 46.28),
    _ChartData(2023, 4240, 53.88),
    _ChartData(2024, 4880, 61.38),
    _ChartData(2025, 5270, 65.63),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Column(
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((LineBarSpot touchedSpot) {
                        final flSpot =
                            touchedSpot.bar.spots[touchedSpot.spotIndex];
                        String yText;
                        if (touchedSpot.barIndex == 0) {
                          yText =
                              '${flSpot.y.toStringAsFixed(2)} tỉ người dùng';
                        } else {
                          final percentage = (flSpot.y / 6) * 100;
                          yText = '${percentage.toStringAsFixed(2)}% dân số';
                        }
                        return LineTooltipItem(
                          yText,
                          TextStyle(
                            color: touchedSpot.bar.color,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
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
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1.2,
                      getTitlesWidget: rightTitleWidgets,
                    ),
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
                      interval: 1,
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d)),
                ),
                minX: 2007,
                maxX: 2025,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots:
                        chartData
                            .map(
                              (d) => FlSpot(d.year.toDouble(), d.users / 1000),
                            )
                            .toList(),
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots:
                        chartData
                            .map(
                              (d) => FlSpot(
                                d.year.toDouble(),
                                d.penetration / 100 * 6,
                              ),
                            )
                            .toList(),
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Legend(color: Colors.green, text: 'Người dùng (tỉ người)'),
              const SizedBox(width: 16),
              _Legend(color: Colors.blue, text: 'Tỷ lệ thâm nhập (%)'),
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
    Widget text = Text(value.toInt().toString(), style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      angle: -0.5,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    );
    if (value > meta.max) {
      return Container();
    }
    return Text(
      value.toInt().toString(),
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    );
    if (value > meta.max) {
      return Container();
    }
    final percentage = (value / 6 * 100).round();
    return Text(
      percentage.toString(),
      style: style,
      textAlign: TextAlign.right,
    );
  }
}

class _ChartData {
  _ChartData(this.year, this.users, this.penetration);
  final int year;
  final double users;
  final double penetration;
}

class _Legend extends StatelessWidget {
  final Color color;
  final String text;

  const _Legend({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
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
