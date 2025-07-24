import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FrameworkTrendChart extends StatelessWidget {
  const FrameworkTrendChart({super.key});

  final List<String> _labels = const [
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
  ];

  final List<Map<String, dynamic>> _datasets = const [
    {
      "label": "Cordova",
      "data": [90.0, 85.0, 80.0, 70.0, 60.0, 50.0, 30.0, 10.0, 7.0, 5.0],
      "color": "FF5722",
    },
    {
      "label": "Ionic",
      "data": [80.0, 85.0, 80.0, 75.0, 70.0, 60.0, 45.0, 30.0, 19.0, 15.0],
      "color": "FFC107",
    },

    {
      "label": "Xamarin",
      "data": [60.0, 75.0, 72.0, 70.0, 50.0, 45.0, 40.0, 25.0, 15.0, 10.0],
      "color": "9C27B0",
    },
    {
      "label": "React Native",
      "data": [50.0, 70.0, 85.0, 90.0, 95.0, 90.0, 85.0, 80.0, 75.0, 70.0],
      "color": "4CAF50",
    },
    {
      "label": "Flutter",
      "data": [0.0, 0.0, 20.0, 40.0, 60.0, 80.0, 90.0, 95.0, 100.0, 100.0],
      "color": "2196F3",
    },
  ];

  Color _hexToColor(String code) {
    return Color(int.parse(code, radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    final lineBarsData =
        _datasets.map((dataset) {
          final data = dataset['data'] as List<double>;
          final spots =
              data.asMap().entries.map((entry) {
                final year = double.parse(_labels[entry.key]);
                return FlSpot(year, entry.value);
              }).toList();

          return LineChartBarData(
            spots: spots,
            isCurved: true,
            color: _hexToColor(dataset['color'] as String),
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          );
        }).toList();

    return AspectRatio(
      aspectRatio: 1.7,
      child: Column(
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: lineBarsData,
                minX: 2015,
                maxX: 2024,
                minY: 0,
                maxY: 100,
                titlesData: FlTitlesData(
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
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 40,
                      interval: 20,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(color: Colors.white24, strokeWidth: 1);
                  },
                  getDrawingVerticalLine: (value) {
                    return const FlLine(color: Colors.white24, strokeWidth: 1);
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children:
                _datasets
                    .map(
                      (dataset) => _Legend(
                        color: _hexToColor(dataset['color'] as String),
                        text: dataset['label'] as String,
                      ),
                    )
                    .toList(),
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
      angle: -0.5,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );
    if (value > meta.max || value < meta.min) {
      return Container();
    }
    return Text('${value.toInt()}%', style: style, textAlign: TextAlign.left);
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
          decoration: BoxDecoration(color: color, shape: BoxShape.rectangle),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
