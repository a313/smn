import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'animations.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  const TextWidget({super.key, required this.text, this.color, this.fontSize});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
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
      padding: const EdgeInsets.all(16.0),
      child: Text(
        widget.text,
        textAlign: TextAlign.left,
        style: textTheme.displayMedium?.copyWith(
          color: widget.color ?? Colors.white,
          fontSize: widget.fontSize,
        ),
      ).animate().addEffects(_animation),
    );
  }
}
