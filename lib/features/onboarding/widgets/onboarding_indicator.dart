import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    required this.controller,
    required this.count,
  });

  final PageController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        spacing: 8,
        expansionFactor: 3,
        activeDotColor: const Color(0xFF7C4DFF),
        dotColor: Colors.white24,
      ),
    );
  }
}
