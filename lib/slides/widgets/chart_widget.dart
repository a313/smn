import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final Widget chart;
  const ChartWidget({super.key, required this.chart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 600, child: chart);
  }
}
