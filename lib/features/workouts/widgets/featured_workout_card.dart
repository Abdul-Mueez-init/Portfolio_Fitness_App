import 'package:flutter/material.dart';

class FeaturedWorkoutCard extends StatelessWidget {
  const FeaturedWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xff3b82f6), Color(0xff1d4ed8)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "FULL BODY BLAST",
            style: TextStyle(color: Colors.white70, letterSpacing: 1.2),
          ),
          SizedBox(height: 10),
          Text(
            "45 MIN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "High intensity workout for maximum calorie burn.",
            style: TextStyle(color: Colors.white, height: 1.5),
          ),
        ],
      ),
    );
  }
}
