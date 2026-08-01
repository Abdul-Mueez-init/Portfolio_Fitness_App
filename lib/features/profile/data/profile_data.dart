import '../models/user_profile.dart';

/// Static/mock profile data for the MVP.
///
/// This exists purely as a data source so [ProfileService] has something
/// to return. It should never be imported or referenced directly by the
/// UI — always go through the service layer so this can later be swapped
/// for local persistence or a backend without touching any widgets.
final UserProfile mockUserProfile = const UserProfile(
  id: 'user_001',
  name: 'Abdul Mueez',
  email: 'abdul.mueez@fitforge.app',
  avatarUrl:
      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=300',
  goal: 'Build Muscle',
  fitnessLevel: 'Intermediate',
  trainingPreference: 'Strength Training',
  trainingExperience: '1–2 Years',
);
