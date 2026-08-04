import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/routes/app_router.dart';
import 'features/auth/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await AuthService().initializeGoogleSignIn();

  runApp(const FitForgeApp());
}

class FitForgeApp extends StatelessWidget {
  const FitForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FitForge AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      routerConfig: AppRouter.router,
    );
  }
}
