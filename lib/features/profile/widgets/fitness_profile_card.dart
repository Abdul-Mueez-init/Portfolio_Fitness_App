import 'package:flutter/material.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/theme/colors.dart';
import '../../../widgets/glass_card.dart';
import '../models/user_profile.dart';
import 'profile_info_row.dart';

/// The section that differentiates Profile from Home: personal fitness
/// *configuration* (goal, level, preference, experience) rather than
/// daily performance metrics.
class FitnessProfileCard extends StatelessWidget {
  final UserProfile profile;

  const FitnessProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Fitness Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          ProfileInfoRow(
            icon: Icons.flag_rounded,
            iconColor: AppColors.primary,
            title: 'Primary Goal',
            value: profile.goal,
          ),

          const SizedBox(height: AppSpacing.lg),

          ProfileInfoRow(
            icon: Icons.bolt_rounded,
            iconColor: AppColors.warning,
            title: 'Fitness Level',
            value: profile.fitnessLevel,
          ),

          const SizedBox(height: AppSpacing.lg),

          ProfileInfoRow(
            icon: Icons.fitness_center_rounded,
            iconColor: AppColors.secondary,
            title: 'Training Preference',
            value: profile.trainingPreference,
          ),

          const SizedBox(height: AppSpacing.lg),

          ProfileInfoRow(
            icon: Icons.trending_up_rounded,
            iconColor: AppColors.success,
            title: 'Training Experience',
            value: profile.trainingExperience,
          ),
        ],
      ),
    );
  }
}
