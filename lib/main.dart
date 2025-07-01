import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import 'core/navigation/app_router.dart';
import 'core_ui/core_ui.dart';
import 'features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: <SingleChildWidget>[
        RepositoryProvider<FirebaseAuthDataSource>(
          create: (_) => FirebaseAuthDataSource(FirebaseAuth.instance),
        ),
        RepositoryProvider<AuthRepository>(
          create: (BuildContext context) =>
              AuthRepositoryImpl(context.read<FirebaseAuthDataSource>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(
              signInUseCase: SignInUseCase(context.read<AuthRepository>()),
              signUpUseCase: SignUpUseCase(context.read<AuthRepository>()),
            ),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
        ),
      ),
    );
  }
}
