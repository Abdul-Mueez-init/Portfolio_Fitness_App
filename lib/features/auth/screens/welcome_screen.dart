import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_divider.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
import '../widgets/social_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Column(
        children: [
          const Spacer(),

          const AuthHeader(
            title: 'Welcome to FitForge AI',
            subtitle:
                'Your personal AI fitness coach designed to help you train smarter and stay consistent.',
          ),

          const Spacer(),

          PrimaryButton(
            text: 'Login',
            icon: Icons.login,
            onPressed: () {
              context.push(RouteNames.login);
            },
          ),

          const SizedBox(height: 16),

          SecondaryButton(
            text: 'Create Account',
            icon: Icons.person_add_alt_1,
            onPressed: () {
              context.push(RouteNames.register);
            },
          ),

          const SizedBox(height: 30),

          const AuthDivider(),

          const SizedBox(height: 30),

          SocialButton(
            text: 'Continue with Google',
            icon: SvgPicture.asset(
              'assets/icons/google.svg',
              width: 22,
              height: 22,
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 30),

          AuthFooter(
            question: 'Already have an account?',
            actionText: 'Login',
            onTap: () {
              context.push(RouteNames.login);
            },
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
