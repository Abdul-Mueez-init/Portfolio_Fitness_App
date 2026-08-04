import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key, this.size = 130});

  final double size;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 800),
      child: ZoomIn(
        duration: const Duration(milliseconds: 900),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF7C4DFF), Color(0xFF00E5FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x667C4DFF),
                blurRadius: 35,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Icon(
            Icons.fitness_center_rounded,
            color: Colors.white,
            size: 58,
          ),
        ),
      ),
    );
  }
}
