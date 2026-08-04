import 'package:flutter/material.dart';

class AnimatedOnboardingImage extends StatefulWidget {
  const AnimatedOnboardingImage({super.key, required this.image});

  final String image;

  @override
  State<AnimatedOnboardingImage> createState() =>
      _AnimatedOnboardingImageState();
}

class _AnimatedOnboardingImageState extends State<AnimatedOnboardingImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: Image.asset(widget.image, fit: BoxFit.contain),
    );
  }
}
