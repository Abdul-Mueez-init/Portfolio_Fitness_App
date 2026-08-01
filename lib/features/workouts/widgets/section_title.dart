import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onPressed;

  const SectionTitle({
    super.key,
    required this.title,
    this.actionText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        if (actionText != null)
          TextButton(
            onPressed: onPressed,
            child: Text(
              actionText!,
              style: const TextStyle(
                color: Color(0xff3b82f6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
