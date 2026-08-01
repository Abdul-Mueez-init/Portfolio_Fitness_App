import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final int value;
  final String label;

  const AnimatedCounter({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: value),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Text(
              "$value",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
      ],
    );
  }
}
