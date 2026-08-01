import 'package:flutter/material.dart';

import '../../core/constants/spacing.dart';
import '../../core/theme/colors.dart';
import 'models/user_profile.dart';
import 'services/profile_service.dart';
import 'widgets/fitness_profile_card.dart';
import 'widgets/premium_banner.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menu_tile.dart';
import 'widgets/profile_section.dart';

/// Profile = ME.
///
/// Answers "who is this user, what are their fitness preferences, and
/// how is their FitForge account configured?" — deliberately does NOT
/// duplicate anything already owned by Home (today's goal, steps,
/// calories, weekly activity, coach tips, etc).
///
/// This screen is composition only: it fetches a [UserProfile] from
/// [ProfileService] and arranges reusable widgets around it. No business
/// logic, no persistence, no hardcoded dataset.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final ProfileService _service = const ProfileService();

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Wraps [child] in a subtle fade + upward slide, staggered by [index]
  /// out of [total] sections so the screen enters top-to-bottom rather
  /// than all at once.
  Widget _animated({
    required int index,
    required int total,
    required Widget child,
  }) {
    final start = index / total * 0.5;
    final end = start + 0.5;

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOut),
    );

    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.04),
          end: Offset.zero,
        ).animate(curved),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: FutureBuilder<UserProfile>(
          future: _service.getProfile(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            final profile = snapshot.data!;
            const sectionCount = 5;

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.xxl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _animated(
                    index: 0,
                    total: sectionCount,
                    child: ProfileHeader(profile: profile),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  _animated(
                    index: 1,
                    total: sectionCount,
                    child: FitnessProfileCard(profile: profile),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  _animated(
                    index: 2,
                    total: sectionCount,
                    child: ProfileSection(
                      title: 'Account',
                      children: const [
                        ProfileMenuTile(
                          icon: Icons.badge_outlined,
                          title: 'Personal Information',
                        ),
                        ProfileMenuTile(
                          icon: Icons.notifications_outlined,
                          title: 'Notifications',
                        ),
                        ProfileMenuTile(
                          icon: Icons.tune_rounded,
                          title: 'Preferences',
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  _animated(
                    index: 3,
                    total: sectionCount,
                    child: const PremiumBanner(),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  _animated(
                    index: 4,
                    total: sectionCount,
                    child: ProfileSection(
                      title: 'Support',
                      children: const [
                        ProfileMenuTile(
                          icon: Icons.help_outline_rounded,
                          title: 'Help & Support',
                        ),
                        ProfileMenuTile(
                          icon: Icons.info_outline_rounded,
                          title: 'About FitForge',
                        ),
                        ProfileMenuTile(
                          icon: Icons.privacy_tip_outlined,
                          title: 'Privacy',
                        ),
                        ProfileMenuTile(
                          icon: Icons.description_outlined,
                          title: 'Terms',
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
