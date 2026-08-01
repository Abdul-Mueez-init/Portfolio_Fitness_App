import 'coach_option.dart';

class CoachNode {
  final String id;
  final String message;
  final List<CoachOption> options;

  const CoachNode({
    required this.id,
    required this.message,
    required this.options,
  });
}
