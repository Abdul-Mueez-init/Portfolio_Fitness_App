/// Pure data model representing the current user's identity and fitness
/// configuration.
///
/// This model intentionally does NOT contain daily dashboard metrics
/// (steps, calories, today's goal, weekly activity, coach tips, etc).
/// Those belong to the Home feature. Profile only owns who the user is
/// and how their fitness experience is configured.
class UserProfile {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String goal;
  final String fitnessLevel;
  final String trainingPreference;
  final String trainingExperience;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.goal,
    required this.fitnessLevel,
    required this.trainingPreference,
    required this.trainingExperience,
  });
}
