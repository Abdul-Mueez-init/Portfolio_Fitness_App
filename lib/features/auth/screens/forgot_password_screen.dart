import 'package:flutter/material.dart';

import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _resetPassword() {
    // Firebase reset password next phase.
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),

            const AuthHeader(
              title: "Forgot Password?",
              subtitle:
                  "Enter your email address and we'll send you a password reset link.",
            ),

            const SizedBox(height: 40),

            AuthTextField(
              controller: _controller,
              hintText: "Email",
              prefixIcon: Icons.email_outlined,
            ),

            const SizedBox(height: 30),

            PrimaryButton(
              text: "Send Reset Link",
              icon: Icons.send,
              onPressed: _resetPassword,
            ),
          ],
        ),
      ),
    );
  }
}
