import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/routes/main_shell.dart';

void main() {
  runApp(const FitForgeApp());
}

class FitForgeApp extends StatelessWidget {
  const FitForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitForge AI',
      theme: AppTheme.dark,
      home: const MainShell(),
    );
  }
}
