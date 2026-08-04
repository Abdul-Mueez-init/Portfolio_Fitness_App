import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashNavigationService {
  static const onboardingKey = 'onboarding_completed';

  Future<SplashDestination> getDestination() async {
    final prefs = await SharedPreferences.getInstance();

    final onboardingCompleted = prefs.getBool(onboardingKey) ?? false;

    if (!onboardingCompleted) {
      return SplashDestination.onboarding;
    }

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return SplashDestination.welcome;
    }

    return SplashDestination.home;
  }
}

enum SplashDestination { onboarding, welcome, home }
