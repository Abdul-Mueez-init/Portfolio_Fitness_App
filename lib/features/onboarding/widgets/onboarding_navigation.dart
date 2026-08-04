import 'package:flutter/material.dart';

import '../../auth/widgets/primary_button.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    super.key,
    required this.isLastPage,
    required this.onNext,
    required this.onSkip,
  });

  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: isLastPage ? "Get Started" : "Next",
          icon: isLastPage ? Icons.arrow_forward : Icons.navigate_next,
          onPressed: onNext,
        ),

        const SizedBox(height: 12),

        if (!isLastPage)
          TextButton(
            onPressed: onSkip,
            child: const Text("Skip", style: TextStyle(color: Colors.white70)),
          ),
      ],
    );
  }
}
