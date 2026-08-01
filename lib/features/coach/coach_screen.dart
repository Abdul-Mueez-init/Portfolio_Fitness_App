import 'package:flutter/material.dart';

import 'models/chat_message.dart';
import 'models/coach_node.dart';
import 'models/coach_option.dart';
import 'services/coach_engine.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/coach_app_bar.dart';
import 'widgets/option_chip.dart';
import 'widgets/typing_indicator.dart';

class CoachScreen extends StatefulWidget {
  const CoachScreen({super.key});

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  final CoachEngine _engine = const CoachEngine();

  final ScrollController _scrollController = ScrollController();

  final List<ChatMessage> _messages = [];

  late CoachNode _currentNode;

  bool _isTyping = false;

  @override
  void initState() {
    super.initState();

    _currentNode = _engine.getStartNode();

    _addAiMessage(_currentNode.message);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _addAiMessage(String text) {
    setState(() {
      _messages.add(
        ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: text,
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
    });

    _scrollToBottom();
  }

  void _addUserMessage(String text) {
    setState(() {
      _messages.add(
        ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );
    });

    _scrollToBottom();
  }

  Future<void> _selectOption(CoachOption option) async {
    if (_isTyping) return;

    _addUserMessage(option.text);

    setState(() {
      _isTyping = true;
    });

    _scrollToBottom();

    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;

    final nextNode = _engine.getNextNode(option.nextNodeId);

    setState(() {
      _currentNode = nextNode;
      _isTyping = false;
    });

    _addAiMessage(nextNode.message);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CoachAppBar(),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildOptions(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    final itemCount = _messages.length + (_isTyping ? 1 : 0);

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (_isTyping && index == _messages.length) {
          return const TypingIndicator();
        }

        return ChatBubble(message: _messages[index]);
      },
    );
  }

  Widget _buildOptions() {
    if (_currentNode.options.isEmpty) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: _currentNode.options.map((option) {
            return OptionChip(
              option: option,
              isEnabled: !_isTyping,
              onPressed: () => _selectOption(option),
            );
          }).toList(),
        ),
      ),
    );
  }
}
