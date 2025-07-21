import 'package:flutter/material.dart';

class Slide {
  final String? backgroundImage;
  final List<SlideContentData> content;
  final Alignment alignment;

  Slide({
    this.backgroundImage,
    required this.content,
    this.alignment = Alignment.center,
  });
}

sealed class SlideContentData {}

class TitleContent extends SlideContentData {
  final String title;
  final Color? color;
  final double? fontSize;
  TitleContent(this.title, {this.color, this.fontSize});
}

class TextContent extends SlideContentData {
  final String text;
  final Color? color;
  final double? fontSize;
  TextContent(this.text, {this.color, this.fontSize});
}

class ChartContent extends SlideContentData {
  final Widget chart;
  ChartContent(this.chart);
}

class TableContent extends SlideContentData {
  final List<List<String>> table;
  TableContent(this.table);
}
