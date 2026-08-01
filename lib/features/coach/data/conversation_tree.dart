import '../models/coach_node.dart';
import '../models/coach_option.dart';

final Map<String, CoachNode> conversationTree = {
  // ==========================
  // MAIN MENU
  // ==========================
  'start': const CoachNode(
    id: 'start',
    message:
        'Hey! 👋 I\'m your AI Coach.\n\nWhat would you like help with today?',
    options: [
      CoachOption(
        id: 'muscle',
        text: '💪 Build Muscle',
        nextNodeId: 'muscle_goal',
      ),
      CoachOption(id: 'fat', text: '🔥 Lose Fat', nextNodeId: 'fat_goal'),
      CoachOption(
        id: 'nutrition',
        text: '🥗 Nutrition',
        nextNodeId: 'nutrition_goal',
      ),
      CoachOption(
        id: 'supplements',
        text: '💊 Supplements',
        nextNodeId: 'supplement_goal',
      ),
    ],
  ),

  // ==========================
  // RETURN TO MAIN MENU
  // ==========================
  'main_menu': const CoachNode(
    id: 'main_menu',
    message: 'What else can I help you with?',
    options: [
      CoachOption(
        id: 'muscle',
        text: '💪 Build Muscle',
        nextNodeId: 'muscle_goal',
      ),
      CoachOption(id: 'fat', text: '🔥 Lose Fat', nextNodeId: 'fat_goal'),
      CoachOption(
        id: 'nutrition',
        text: '🥗 Nutrition',
        nextNodeId: 'nutrition_goal',
      ),
      CoachOption(
        id: 'supplements',
        text: '💊 Supplements',
        nextNodeId: 'supplement_goal',
      ),
    ],
  ),

  // ==========================
  // BUILD MUSCLE
  // ==========================
  'muscle_goal': const CoachNode(
    id: 'muscle_goal',
    message: 'Awesome choice! 💪\n\nWhat is your experience level?',
    options: [
      CoachOption(
        id: 'beginner',
        text: 'Beginner',
        nextNodeId: 'beginner_muscle',
      ),
      CoachOption(
        id: 'intermediate',
        text: 'Intermediate',
        nextNodeId: 'intermediate_muscle',
      ),
      CoachOption(
        id: 'advanced',
        text: 'Advanced',
        nextNodeId: 'advanced_muscle',
      ),
    ],
  ),

  'beginner_muscle': const CoachNode(
    id: 'beginner_muscle',
    message:
        'Great! As a beginner, focus on compound exercises like Squats, Bench Press, Rows and Overhead Press.\n\nTrain 3–4 days per week and prioritize proper form.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),

  'intermediate_muscle': const CoachNode(
    id: 'intermediate_muscle',
    message:
        'Perfect! Progressive overload should be your main focus.\n\nAim for 10–20 quality sets per muscle group every week.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),

  'advanced_muscle': const CoachNode(
    id: 'advanced_muscle',
    message:
        'Excellent! At your level, recovery, training intensity and periodization become just as important as volume.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),

  // ==========================
  // FAT LOSS
  // ==========================
  'fat_goal': const CoachNode(
    id: 'fat_goal',
    message:
        'Fat loss comes down to maintaining a calorie deficit while preserving muscle.\n\nWould you like help with diet or workouts?',
    options: [
      CoachOption(id: 'diet', text: 'Diet', nextNodeId: 'fat_diet'),
      CoachOption(id: 'workout', text: 'Workout', nextNodeId: 'fat_workout'),
    ],
  ),

  'fat_diet': const CoachNode(
    id: 'fat_diet',
    message:
        'Increase protein intake, reduce processed foods and maintain a moderate calorie deficit of around 300–500 calories.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),

  'fat_workout': const CoachNode(
    id: 'fat_workout',
    message:
        'Combine strength training with regular walking or cardio. Aim to stay active every day rather than relying only on long cardio sessions.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),

  // ==========================
  // NUTRITION
  // ==========================
  'nutrition_goal': const CoachNode(
    id: 'nutrition_goal',
    message:
        'A balanced diet should include protein, carbohydrates, healthy fats and plenty of fruits and vegetables.\n\nWhat do you need help with?',
    options: [
      CoachOption(id: 'protein', text: 'Protein', nextNodeId: 'protein_info'),
      CoachOption(id: 'carbs', text: 'Carbohydrates', nextNodeId: 'carbs_info'),
    ],
  ),

  'protein_info': const CoachNode(
    id: 'protein_info',
    message:
        'Most active people benefit from around 1.6–2.2 g of protein per kilogram of body weight each day.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),

  'carbs_info': const CoachNode(
    id: 'carbs_info',
    message:
        'Carbohydrates provide energy for training. Choose whole grains, oats, rice, potatoes and fruits as primary sources.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),

  // ==========================
  // SUPPLEMENTS
  // ==========================
  'supplement_goal': const CoachNode(
    id: 'supplement_goal',
    message:
        'Supplements should complement a good diet—not replace it.\n\nWhich supplement do you want to learn about?',
    options: [
      CoachOption(id: 'whey', text: 'Whey Protein', nextNodeId: 'whey_info'),
      CoachOption(
        id: 'creatine',
        text: 'Creatine',
        nextNodeId: 'creatine_info',
      ),
    ],
  ),

  'whey_info': const CoachNode(
    id: 'whey_info',
    message:
        'Whey protein is simply a convenient way to increase your daily protein intake. It is not mandatory if you already meet your protein needs through food.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),

  'creatine_info': const CoachNode(
    id: 'creatine_info',
    message:
        'Creatine monohydrate is one of the most researched sports supplements. A typical maintenance dose is 3–5 g daily.',
    options: [
      CoachOption(
        id: 'back_to_menu',
        text: '← Back to Coach',
        nextNodeId: 'main_menu',
      ),
    ],
  ),
};
