import '../data/profile_data.dart';
import '../models/user_profile.dart';

/// Abstracts where profile data comes from.
///
/// For the MVP this simply returns the local mock profile. Later this can
/// be backed by local storage, an API, or Firebase without ProfileScreen
/// needing to change — the same architectural philosophy as
/// CoachScreen -> CoachEngine -> ConversationTree.
class ProfileService {
  const ProfileService();

  Future<UserProfile> getProfile() async {
    return mockUserProfile;
  }
}
