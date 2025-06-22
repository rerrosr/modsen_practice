import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core_ui/core_ui.dart';
import 'features/authentication/presentation/pages/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    ),
  );
}
