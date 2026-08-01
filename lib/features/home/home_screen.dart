import 'package:flutter/material.dart';

import '../../core/constants/spacing.dart';
import '../../widgets/animated_counter.dart';
import '../../widgets/animated_progress_ring.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/workout_card.dart';
import '../../widgets/ai_coach_card.dart';
import '../../widgets/activity_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FitForge AI")),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          children: [
            GlassCard(
              child: Column(
                children: [
                  const Text(
                    "Today's Goal",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 30),

                  const AnimatedProgressRing(progress: .72),

                  const SizedBox(height: 35),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedCounter(value: 8400, label: "Steps"),
                      AnimatedCounter(value: 1250, label: "Calories"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const WorkoutCard(
              title: "Upper Body Strength",
              muscles: "Chest • Shoulders • Triceps",
              duration: "60 mins",
              calories: 580,
            ),

            const SizedBox(height: 24),

            const ActivityChart(),

            const SizedBox(height: 24),

            const AICoachCard(),
          ],
        ),
      ),
    );
  }
}
