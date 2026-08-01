import 'package:flutter/material.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/theme/colors.dart';

/// A single row inside [FitnessProfileCard] (or any future profile
/// section) showing an icon, a title/value pair, and an optional
/// trailing action.
///
/// Kept generic and reusable so future profile attributes never require
/// a brand new widget — only a new row.
class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final Widget? trailing;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.iconColor = AppColors.primary,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),

        const SizedBox(width: AppSpacing.md),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),

        if (trailing != null) trailing!,
      ],
    );
  }
}
