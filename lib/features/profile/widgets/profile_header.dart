import 'package:flutter/material.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/theme/colors.dart';
import '../models/user_profile.dart';

/// The visual centerpiece of Profile: identity + fitness journey.
///
/// Deliberately restrained — no follower counts, no badges, no cover
/// image. Just avatar, name, member identity and an edit entry point.
class ProfileHeader extends StatelessWidget {
  final UserProfile profile;
  final VoidCallback? onEditPressed;

  const ProfileHeader({super.key, required this.profile, this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.4),
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(3),
          child: ClipOval(
            child: Image.network(
              profile.avatarUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.surface,
                child: const Icon(
                  Icons.person_rounded,
                  color: AppColors.textSecondary,
                  size: 40,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        Text(
          profile.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          'Fitness Member',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),

        const SizedBox(height: AppSpacing.md),

        OutlinedButton.icon(
          onPressed: onEditPressed,
          icon: const Icon(Icons.edit_outlined, size: 16),
          label: const Text('Edit Profile'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
            shape: RoundedRectangleBorder(
              borderRadius: AppSpacing.buttonRadius,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
          ),
        ),
      ],
    );
  }
}
