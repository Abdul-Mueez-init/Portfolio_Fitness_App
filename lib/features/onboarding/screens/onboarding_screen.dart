import 'package:flutter/material.dart';

import '../../auth/widgets/auth_background.dart';
import '../data/onboarding_pages.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_navigation.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == onboardingPages.length - 1) {
      // SharedPreferences + Welcome Screen
      return;
    }

    _controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _skip() {
    _controller.animateToPage(
      onboardingPages.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (_, index) {
                  return OnboardingPage(page: onboardingPages[index]);
                },
              ),
            ),

            OnboardingIndicator(
              controller: _controller,
              count: onboardingPages.length,
            ),

            const SizedBox(height: 30),

            OnboardingNavigation(
              isLastPage: _currentPage == onboardingPages.length - 1,
              onNext: _nextPage,
              onSkip: _skip,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
