import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key, this.size = 90});

  final double size;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 700),
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFF7C4DFF), Color(0xFF00E5FF)],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x557C4DFF),
              blurRadius: 28,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          Icons.fitness_center_rounded,
          color: Colors.white,
          size: size * .42,
        ),
      ),
    );
  }
}
