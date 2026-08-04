import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../services/splash_navigation_service.dart';
import '../widgets/animated_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _service = SplashNavigationService();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    final destination = await _service.getDestination();

    if (!mounted) return;

    switch (destination) {
      case SplashDestination.onboarding:
        print('Navigate -> Onboarding');
        break;

      case SplashDestination.welcome:
        print('Navigate -> Welcome');
        break;

      case SplashDestination.home:
        print('Navigate -> Home');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            const AnimatedLogo(size: 130),

            const SizedBox(height: 28),

            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: const Text(
                'FITFORGE AI',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                ),
              ),
            ),

            const SizedBox(height: 10),

            FadeInUp(
              delay: const Duration(milliseconds: 250),
              child: const Text(
                'Forge Your Strongest Self',
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ),

            const Spacer(),

            const SizedBox(
              width: 34,
              height: 34,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),

            const SizedBox(height: 20),

            const Text(
              'Preparing your fitness experience...',
              style: TextStyle(color: Colors.white54),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
