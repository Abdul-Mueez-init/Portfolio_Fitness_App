import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, this.text = 'OR CONTINUE WITH'});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.white.withOpacity(.12), thickness: 1),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
              fontSize: 12,
            ),
          ),
        ),

        Expanded(
          child: Divider(color: Colors.white.withOpacity(.12), thickness: 1),
        ),
      ],
    );
  }
}
