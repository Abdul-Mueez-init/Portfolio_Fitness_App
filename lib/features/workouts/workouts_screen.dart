import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import 'widgets/continue_workout_card.dart';
import 'widgets/featured_workout_card.dart';
import 'widgets/section_title.dart';
import 'widgets/workout_category_chip.dart';
import 'widgets/workout_list_card.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // Header
              const Text(
                "Workouts",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Find the perfect workout for today.",
                style: TextStyle(
                  color: Colors.white.withOpacity(.65),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              // Search
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.white54,
                    ),
                    hintText: "Search workouts...",
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                ),
              ),

              const SizedBox(height: 36),

              const SectionTitle(title: "Categories"),

              const SizedBox(height: 18),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  WorkoutCategoryChip(title: "💪 Strength", selected: true),
                  WorkoutCategoryChip(title: "🏃 Cardio"),
                  WorkoutCategoryChip(title: "🔥 HIIT"),
                  WorkoutCategoryChip(title: "🧘 Yoga"),
                  WorkoutCategoryChip(title: "🏋 Gym"),
                  WorkoutCategoryChip(title: "🚴 Cycling"),
                ],
              ),

              const SizedBox(height: 36),

              const SectionTitle(title: "Featured Workout"),

              const SizedBox(height: 18),

              const FeaturedWorkoutCard(),

              const SizedBox(height: 36),

              const SectionTitle(title: "Continue"),

              const SizedBox(height: 18),

              const ContinueWorkoutCard(),

              const SizedBox(height: 36),

              const SectionTitle(
                title: "Popular Workouts",
                actionText: "See All",
              ),

              const SizedBox(height: 18),

              const WorkoutListCard(
                title: "Upper Body Strength",
                difficulty: "Beginner",
                difficultyColor: Colors.green,
                duration: "45 min",
                calories: "420 kcal",
                image:
                    "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=1200",
              ),

              const WorkoutListCard(
                title: "HIIT Fat Burner",
                difficulty: "Advanced",
                difficultyColor: Colors.red,
                duration: "25 min",
                calories: "360 kcal",
                image:
                    "https://images.unsplash.com/photo-1518611012118-696072aa579a?w=1200",
              ),

              const WorkoutListCard(
                title: "Morning Yoga",
                difficulty: "Intermediate",
                difficultyColor: Colors.orange,
                duration: "30 min",
                calories: "210 kcal",
                image:
                    "https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=1200",
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
