import 'package:flutter/material.dart';

import '../../../widgets/glass_card.dart';
import 'difficulty_badge.dart';
import 'info_chip.dart';
import 'primary_action_button.dart';

class WorkoutListCard extends StatelessWidget {
  final String title;
  final String difficulty;
  final Color difficultyColor;
  final String duration;
  final String calories;
  final String image;
  final VoidCallback? onTap;

  const WorkoutListCard({
    super.key,
    required this.title,
    required this.difficulty,
    required this.difficultyColor,
    required this.duration,
    required this.calories,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Hero(
        tag: title,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: onTap,
            child: GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      image,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      DifficultyBadge(text: difficulty, color: difficultyColor),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [
                      InfoChip(icon: Icons.schedule, text: duration),
                      const SizedBox(width: 10),
                      InfoChip(
                        icon: Icons.local_fire_department,
                        text: calories,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerRight,
                    child: PrimaryActionButton(
                      title: "Start Workout",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
