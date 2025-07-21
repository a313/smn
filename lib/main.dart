import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smn/slide_data.dart';

import 'slides/slides_provider.dart';
import 'slides/slideshow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slideshow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => SlidesProvider(slides),
        child: Slideshow(slides: slides),
      ),
    );
  }
}
