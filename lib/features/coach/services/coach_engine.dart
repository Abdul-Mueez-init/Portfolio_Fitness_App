import '../data/conversation_tree.dart';
import '../models/coach_node.dart';

class CoachEngine {
  const CoachEngine();

  CoachNode getStartNode() {
    return conversationTree['start']!;
  }

  CoachNode getNextNode(String nodeId) {
    return conversationTree[nodeId]!;
  }
}
