import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class WorkoutProgressBar extends StatelessWidget {
  final double progress;

  const WorkoutProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 10,
        backgroundColor: AppColors.surface,
        valueColor: const AlwaysStoppedAnimation(AppColors.primary),
      ),
    );
  }
}
