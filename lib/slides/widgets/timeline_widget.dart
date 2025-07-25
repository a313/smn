import 'package:flutter/material.dart';

import '../slide.dart';

const itemHeight = 210.0;
const itemWidth = 300.0;
const arrWidth = 190.0;
const arrHeight = 90.0;

class TimelineWidget extends StatelessWidget {
  final List<TimelineData> data;
  const TimelineWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const double overlapOffset = arrWidth - 10.0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 500,
        width: (data.length * overlapOffset) + itemWidth,

        child: Stack(
          children:
              data.asMap().entries.map((entry) {
                final index = entry.key;
                final timelineData = entry.value;

                return Positioned(
                  left: index * overlapOffset,
                  child: TimelineTile(
                    data: timelineData,
                    isFirst: index == 0,
                    isTop: index.isEven,
                  ),
                );
              }).toList(),
        ),
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
    return SizedBox(
      width: itemWidth,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isTop) _buildContent(context, isTop),
          if (!isTop) const SizedBox(height: itemHeight),
          SizedBox(
            width: arrWidth,
            height: arrHeight,
            child: _buildArrow(data.color, data.datetime),
          ),
          if (!isTop) _buildContent(context, isTop),
          if (isTop) const SizedBox(height: itemHeight),
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

  Widget _buildContent(BuildContext context, bool isTop) {
    return SizedBox(
      height: itemHeight,
      width: itemWidth,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (!isTop) SizedBox(height: 24),
                Text(
                  data.title,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                ...data.contents.map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.white70),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 12,
            height: itemHeight,
            margin: EdgeInsets.only(left: 8),

            child: Stack(
              children: [
                Positioned(
                  bottom: isTop ? 0 : null,
                  left: 4,
                  width: 4,
                  child: Container(
                    height: isTop ? itemHeight - 10 : 40,
                    decoration: BoxDecoration(color: data.color),
                  ),
                ),
                Positioned(
                  top: isTop ? 10 : 30,
                  left: 0,
                  width: 12,
                  height: 12,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 26),
        ],
      ),
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
    const chevronWidth = 30.0;

    if (isFirst) {
      // First item: straight left edge with chevron point on right
      path.moveTo(0, 0);
      path.lineTo(size.width - chevronWidth, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(size.width - chevronWidth, size.height);
      path.lineTo(0, size.height);
      path.close();
    } else {
      // Other items: chevron cuts on both sides (>> shape)
      path.moveTo(0, 0);
      path.lineTo(chevronWidth, size.height / 2);
      path.lineTo(0, size.height);
      path.lineTo(size.width - chevronWidth, size.height);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(size.width - chevronWidth, 0);
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
