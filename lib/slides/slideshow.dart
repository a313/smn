import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smn/slides/widgets/content_widget.dart';

import 'slide.dart';
import 'slides_provider.dart';

class Slideshow extends StatefulWidget {
  final List<Slide> slides;

  const Slideshow({super.key, required this.slides});

  @override
  SlideshowState createState() => SlideshowState();
}

class SlideshowState extends State<Slideshow> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _focusNode.requestFocus(),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      final slidesProvider = context.read<SlidesProvider>();
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        slidesProvider.next();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        slidesProvider.previous();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: Consumer<SlidesProvider>(
          builder: (context, slidesProvider, child) {
            final slide = slidesProvider.currentSlide;
            final step = slidesProvider.stepIndex;
            final visibleContents = slide.content.sublist(0, step + 1);

            return Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(48),
                decoration:
                    slide.backgroundImage != null
                        ? BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(slide.backgroundImage!),
                            fit: BoxFit.cover,
                          ),
                        )
                        : null,
                child: Align(
                  alignment: slide.alignment,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...visibleContents.map(
                        (content) => ContentWidget(content: content),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
