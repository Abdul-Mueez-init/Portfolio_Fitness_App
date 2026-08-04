import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.question,
    required this.actionText,
    required this.onTap,
  });

  final String question;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            question,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),

          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                actionText,
                style: const TextStyle(
                  color: Color(0xFF7C4DFF),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
