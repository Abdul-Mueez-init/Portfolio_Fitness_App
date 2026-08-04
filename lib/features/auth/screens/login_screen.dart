import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Firebase login coming next phase.
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),

              const AuthHeader(
                title: "Welcome Back",
                subtitle: "Login to continue your fitness journey.",
              ),

              const SizedBox(height: 40),

              AuthTextField(
                controller: _emailController,
                hintText: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              AuthTextField(
                controller: _passwordController,
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Minimum 6 characters";
                  }
                  return null;
                },
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.push(RouteNames.forgotPassword);
                  },
                  child: const Text("Forgot Password?"),
                ),
              ),

              const SizedBox(height: 20),

              PrimaryButton(
                text: "Login",
                icon: Icons.login,
                onPressed: _login,
              ),

              const SizedBox(height: 30),

              AuthFooter(
                question: "Don't have an account?",
                actionText: "Register",
                onTap: () {
                  context.go(RouteNames.register);
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
