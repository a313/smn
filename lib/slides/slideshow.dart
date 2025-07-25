import 'package:flutter/gestures.dart';
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
    return Listener(
      onPointerDown: (event) {
        if (event.kind == PointerDeviceKind.mouse &&
            event.buttons == kPrimaryMouseButton) {
          if (context.read<SlidesProvider>().getCurrentSlide().tag != 'chart') {
            context.read<SlidesProvider>().next();
          }
        }
      },
      child: KeyboardListener(
        focusNode: _focusNode,
        onKeyEvent: _handleKeyEvent,
        child: GestureDetector(
          onTap: () => _focusNode.requestFocus(),
          child: Consumer<SlidesProvider>(
            builder: (context, slidesProvider, child) {
              final slide = slidesProvider.currentSlide;
              final step = slidesProvider.stepIndex;

              return Scaffold(
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.all(slide.tag == 'timeline' ? 8 : 48),
                  decoration:
                      slide.backgroundImage != null
                          ? BoxDecoration(
                            image: DecorationImage(
                              image: slide.backgroundImage!.imageProvider,
                              fit: BoxFit.cover,
                            ),
                          )
                          : null,
                  child: Align(
                    alignment: slide.alignment,
                    child: Column(
                      mainAxisAlignment: slide.alignment.toMainAxis,
                      crossAxisAlignment: slide.alignment.toCrossAxis,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...slide.content.asMap().entries.map((entry) {
                          final index = entry.key;
                          final content = entry.value;
                          return Visibility(
                            visible: index <= step,
                            replacement: Opacity(
                              opacity: 0,
                              child: ContentWidget(content: content),
                            ),
                            child: ContentWidget(content: content),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

extension on Alignment {
  MainAxisAlignment get toMainAxis {
    if (y < 0) return MainAxisAlignment.start;
    if (y > 0) return MainAxisAlignment.end;
    return MainAxisAlignment.center;
  }

  CrossAxisAlignment get toCrossAxis {
    if (x < 0) return CrossAxisAlignment.start;
    if (x > 0) return CrossAxisAlignment.end;
    return CrossAxisAlignment.center;
  }
}
