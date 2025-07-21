import 'package:flutter/material.dart';

import '../slide.dart';
import 'chart_widget.dart';
import 'table_widget.dart';
import 'text_widget.dart';
import 'title_widget.dart';

class ContentWidget extends StatelessWidget {
  final SlideContentData content;
  const ContentWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return switch (content) {
      TitleContent(:final title, :final color, :final fontSize) => TitleWidget(
        title: title,
        color: color,
        fontSize: fontSize,
      ),
      TextContent(:final text, :final color, :final fontSize) => TextWidget(
        text: text,
        color: color,
        fontSize: fontSize,
      ),
      ChartContent(:final chart) => ChartWidget(chart: chart),
      TableContent(:final table) => TableWidget(table: table),
    };
  }
}
