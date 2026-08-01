import 'dart:math';

import 'package:flutter/material.dart';

import '../core/theme/colors.dart';

class AnimatedProgressRing extends StatefulWidget {
  final double progress;
  final double size;

  const AnimatedProgressRing({
    super.key,
    required this.progress,
    this.size = 220,
  });

  @override
  State<AnimatedProgressRing> createState() => _AnimatedProgressRingState();
}

class _AnimatedProgressRingState extends State<AnimatedProgressRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        final value =
            Curves.easeOutCubic.transform(controller.value) * widget.progress;

        return SizedBox(
          width: widget.size,
          height: widget.size,

          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size.square(widget.size),
                painter: RingPainter(value),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${(value * 100).toInt()}%",
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Daily Goal",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class RingPainter extends CustomPainter {
  final double progress;

  RingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    final radius = size.width / 2 - 16;

    final background = Paint()
      ..color = Colors.white12
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, background);

    final rect = Rect.fromCircle(center: center, radius: radius);

    final gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: pi * 2,
      colors: const [Color(0xff00E5FF), Color(0xff7C4DFF), Color(0xff00E5FF)],
    );

    final foreground = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    canvas.drawArc(rect, -pi / 2, 2 * pi * progress, false, foreground);
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
