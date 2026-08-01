import 'package:flutter/material.dart';

import 'glass_card.dart';

class AICoachCard extends StatelessWidget {
  const AICoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "🤖 AI Coach",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 12),

          Text("Good morning Abdul Mueez 👋", style: TextStyle(fontSize: 18)),

          SizedBox(height: 8),

          Text(
            "You completed 72% of yesterday's goal.\n"
            "Today's recommendation is Upper Body Strength.\n\n"
            "Estimated calories: 580 kcal",
            style: TextStyle(color: Colors.white70, height: 1.5),
          ),

          SizedBox(height: 20),

          Divider(color: Colors.white24),

          SizedBox(height: 12),

          Text(
            "💡 Coach Tip",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 6),

          Text(
            "Stay hydrated and aim for 8 hours of sleep tonight.",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
