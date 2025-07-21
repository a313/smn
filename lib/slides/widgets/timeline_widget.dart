import 'package:flutter/material.dart';

import '../slide.dart';

class TimelineWidget extends StatelessWidget {
  final List<TimelineData> data;
  const TimelineWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return TimelineTile(
            data: data[index],
            isFirst: index == 0,
            isTop: index.isEven,
          );
        },
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final TimelineData data;
  final bool isFirst;
  final bool isTop;

  const TimelineTile({
    super.key,
    required this.data,
    required this.isFirst,
    required this.isTop,
  });

  @override
  Widget build(BuildContext context) {
    const double itemWidth = 250;
    const double arrowHeight = 60;
    const double contentHeight = 150;

    return SizedBox(
      width: itemWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isTop) _buildContent(context),
          if (isTop) const SizedBox(height: 10),
          _buildArrow(data.color, data.datetime),
          if (!isTop) const SizedBox(height: 10),
          if (!isTop) _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildArrow(Color color, String text) {
    return CustomPaint(
      painter: _ArrowPainter(color: color, isFirst: isFirst),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          data.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.content,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

class _ArrowPainter extends CustomPainter {
  final Color color;
  final bool isFirst;

  _ArrowPainter({required this.color, required this.isFirst});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final path = Path();
    final arrowWidth = 20.0;

    path.moveTo(isFirst ? 0 : arrowWidth, 0);
    path.lineTo(size.width - arrowWidth, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - arrowWidth, size.height);
    path.lineTo(isFirst ? 0 : arrowWidth, size.height);

    if (!isFirst) {
      path.lineTo(0, size.height / 2);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
