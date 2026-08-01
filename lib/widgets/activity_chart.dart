import 'package:flutter/material.dart';

import 'glass_card.dart';

class ActivityChart extends StatelessWidget {
  const ActivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "📊 Weekly Activity",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 180,
            width: double.infinity,
            child: CustomPaint(painter: ChartPainter()),
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<double> values = [0.5, 0.8, 0.6, 0.9, 0.4, 1.0, 0.7];

  final List<String> days = ["M", "T", "W", "T", "F", "S", "S"];

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / values.length;

    final paint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill;

    for (int i = 0; i < values.length; i++) {
      final barHeight = size.height * values[i];

      final x = i * barWidth + 12;

      final y = size.height - barHeight;

      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth - 24, barHeight),
        const Radius.circular(12),
      );

      canvas.drawRRect(rect, paint);

      final textPainter = TextPainter(
        text: TextSpan(
          text: days[i],
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(canvas, Offset(x + 10, size.height + 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
