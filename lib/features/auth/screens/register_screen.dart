import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Firebase registration next phase.
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
                title: "Create Account",
                subtitle: "Start your AI-powered fitness journey.",
              ),

              const SizedBox(height: 40),

              AuthTextField(
                controller: _nameController,
                hintText: "Full Name",
                prefixIcon: Icons.person_outline,
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter your name" : null,
              ),

              const SizedBox(height: 18),

              AuthTextField(
                controller: _emailController,
                hintText: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v == null || v.isEmpty ? "Enter email" : null,
              ),

              const SizedBox(height: 18),

              AuthTextField(
                controller: _passwordController,
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                validator: (v) =>
                    v == null || v.length < 6 ? "Minimum 6 characters" : null,
              ),

              const SizedBox(height: 30),

              PrimaryButton(
                text: "Create Account",
                icon: Icons.person_add_alt_1,
                onPressed: _register,
              ),

              const SizedBox(height: 30),

              AuthFooter(
                question: "Already have an account?",
                actionText: "Login",
                onTap: () {
                  context.go(RouteNames.login);
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
