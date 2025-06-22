import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/authentication/presentation/pages/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: WelcomeScreen()));
}
