import 'package:flutter/material.dart';

import '../models/onboarding_page_model.dart';
import 'animated_onboarding_image.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.page});

  final OnboardingPageModel page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          const Spacer(),

          Expanded(flex: 5, child: AnimatedOnboardingImage(image: page.image)),
          const SizedBox(height: 40),

          Text(
            page.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 18),

          Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.6,
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
