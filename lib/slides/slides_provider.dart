import 'package:flutter/material.dart';

import 'slide.dart';

class SlidesProvider with ChangeNotifier {
  final List<Slide> slides;
  int _slideIndex = 9;
  int _stepIndex = 0;

  SlidesProvider(this.slides);

  int get slideIndex => _slideIndex;
  int get stepIndex => _stepIndex;
  Slide get currentSlide => slides[_slideIndex];

  void next() {
    if (_stepIndex < currentSlide.content.length - 1) {
      _stepIndex++;
    } else if (_slideIndex < slides.length - 1) {
      _slideIndex++;
      _stepIndex = 0;
    }
    notifyListeners();
  }

  void previous() {
    if (_stepIndex > 0) {
      _stepIndex--;
    } else if (_slideIndex > 0) {
      _slideIndex--;
      _stepIndex = slides[_slideIndex].content.length - 1;
    }
    notifyListeners();
  }
}
