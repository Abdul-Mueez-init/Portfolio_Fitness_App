import 'dart:math';

import 'package:flutter/material.dart';

class ProgressRing extends StatelessWidget {
  final double progress;

  const ProgressRing({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: CustomPaint(
        painter: ProgressPainter(progress),
        child: Center(
          child: Text(
            "${(progress * 100).toInt()}%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    final progressPaint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(rect, -pi / 2, 2 * pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
