import 'package:flutter/material.dart';

import 'glass_card.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String muscles;
  final String duration;
  final int calories;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.muscles,
    required this.duration,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "🔥 Today's Workout",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(
                Icons.fitness_center,
                color: Colors.greenAccent,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  muscles,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.timer, color: Colors.orangeAccent, size: 18),
              const SizedBox(width: 8),
              Text(duration, style: const TextStyle(color: Colors.white70)),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(
                Icons.local_fire_department,
                color: Colors.redAccent,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                "$calories kcal",
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text("Start Workout"),
            ),
          ),
        ],
      ),
    );
  }
}
