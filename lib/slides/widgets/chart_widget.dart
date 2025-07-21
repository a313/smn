import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final Widget chart;
  const ChartWidget({super.key, required this.chart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(padding: const EdgeInsets.all(32.0), child: chart),
    );
  }
}
