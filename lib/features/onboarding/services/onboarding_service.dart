import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const String onboardingKey = 'onboarding_completed';

  Future<bool> isCompleted() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(onboardingKey) ?? false;
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(onboardingKey, true);
  }

  Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(onboardingKey);
  }
}
