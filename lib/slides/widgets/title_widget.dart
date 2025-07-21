import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'animations.dart';

class TitleWidget extends StatefulWidget {
  final String title;
  final Color? color;
  final double? fontSize;

  const TitleWidget({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
  });

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  late final List<Effect> _animation;

  @override
  void initState() {
    super.initState();
    _animation = getRandomAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        widget.title,
        style: textTheme.displayLarge?.copyWith(
          color: widget.color ?? Colors.white,
          fontSize: widget.fontSize,
        ),
        textAlign: TextAlign.center,
      ).animate().addEffects(_animation),
    );
  }
}
