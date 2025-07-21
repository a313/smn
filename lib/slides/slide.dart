import 'package:flutter/material.dart';

enum SlideAlignment {
  center,
  centerLeft,
  centerRight,
  topCenter,
  topLeft,
  topRight,
  bottomCenter,
  bottomLeft,
  bottomRight,
}

extension SlideAlignmentExtension on SlideAlignment {
  Alignment get alignment {
    switch (this) {
      case SlideAlignment.center:
        return Alignment.center;
      case SlideAlignment.centerLeft:
        return Alignment.centerLeft;
      case SlideAlignment.centerRight:
        return Alignment.centerRight;
      case SlideAlignment.topCenter:
        return Alignment.topCenter;
      case SlideAlignment.topLeft:
        return Alignment.topLeft;
      case SlideAlignment.topRight:
        return Alignment.topRight;
      case SlideAlignment.bottomCenter:
        return Alignment.bottomCenter;
      case SlideAlignment.bottomLeft:
        return Alignment.bottomLeft;
      case SlideAlignment.bottomRight:
        return Alignment.bottomRight;
    }
  }
}

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

class TimelineData {
  final String title;
  final String content;
  final String datetime;
  final Color color;

  TimelineData({
    required this.title,
    required this.content,
    required this.datetime,
    this.color = Colors.transparent,
  });
}

class TimelineContent extends SlideContentData {
  final List<TimelineData> data;
  TimelineContent(this.data);
}
