import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

final random = Random();

final animations = <Effect>[
  const FadeEffect(duration: Duration(milliseconds: 500)),
  const SlideEffect(begin: Offset(0, 1), duration: Duration(milliseconds: 500)),
  const ScaleEffect(duration: Duration(milliseconds: 500)),
  const ShimmerEffect(duration: Duration(milliseconds: 500)),
  const FlipEffect(duration: Duration(milliseconds: 500)),
];

List<Effect> getRandomAnimation() {
  return [animations[random.nextInt(animations.length)]];
}
