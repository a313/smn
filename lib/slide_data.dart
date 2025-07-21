import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smn/slides/slide.dart';

final slides = [
  Slide(
    backgroundImage:
        'https://images.unsplash.com/photo-1593720213428-28a5b9e94613?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    content: [
      TitleContent('Seminar: Sự phát triển của mobile'),
      TextContent('Cross platform - Flutter'),
    ],
    alignment: Alignment.center,
  ),
  Slide(
    alignment: Alignment.topLeft,
    backgroundImage:
        'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    content: [
      TitleContent('Chào mừng đến với Trình chiếu Flutter'),
      TextContent('Sử dụng các phím mũi tên để điều hướng.'),
    ],
  ),
  Slide(
    alignment: Alignment.centerLeft,
    content: [
      TitleContent('Biểu đồ cột'),
      TextContent('Đây là ví dụ về biểu đồ cột.'),
      ChartContent(_buildBarChart()),
    ],
  ),
  Slide(
    content: [
      TitleContent('Biểu đồ đường'),
      TextContent('Đây là ví dụ về biểu đồ đường.'),
      ChartContent(_buildLineChart()),
    ],
  ),
  Slide(
    content: [
      TitleContent('Biểu đồ tròn'),
      TextContent('Đây là ví dụ về biểu đồ tròn.'),
      ChartContent(_buildPieChart()),
    ],
  ),
  Slide(
    content: [
      TitleContent('Bảng dữ liệu'),
      TextContent('Đây là một bảng dữ liệu đơn giản.'),
      TableContent([
        ['Header 1', 'Header 2', 'Header 3'],
        ['Row 1, Cell 1', 'Row 1, Cell 2', 'Row 1, Cell 3'],
        ['Row 2, Cell 1', 'Row 2, Cell 2', 'Row 2, Cell 3'],
      ]),
    ],
  ),
];

Widget _buildBarChart() {
  return BarChart(
    BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: 20,
      barTouchData: BarTouchData(enabled: false),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget:
                (value, meta) => Text(
                  'Grp ${value.toInt()}',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget:
                (value, meta) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      barGroups: [
        BarChartGroupData(
          x: 0,
          barRods: [BarChartRodData(toY: 8, color: Colors.lightBlueAccent)],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [BarChartRodData(toY: 10, color: Colors.lightBlueAccent)],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [BarChartRodData(toY: 14, color: Colors.lightBlueAccent)],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [BarChartRodData(toY: 15, color: Colors.lightBlueAccent)],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [BarChartRodData(toY: 13, color: Colors.lightBlueAccent)],
        ),
      ],
    ),
  );
}

Widget _buildLineChart() {
  return LineChart(
    LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(show: true),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    ),
  );
}

Widget _buildPieChart() {
  return PieChart(
    PieChartData(
      sectionsSpace: 0,
      centerSpaceRadius: 40,
      sections: [
        PieChartSectionData(
          color: Colors.blue,
          value: 40,
          title: '40%',
          radius: 50,
        ),
        PieChartSectionData(
          color: Colors.red,
          value: 30,
          title: '30%',
          radius: 50,
        ),
        PieChartSectionData(
          color: Colors.green,
          value: 15,
          title: '15%',
          radius: 50,
        ),
        PieChartSectionData(
          color: Colors.yellow,
          value: 15,
          title: '15%',
          radius: 50,
        ),
      ],
    ),
  );
}
