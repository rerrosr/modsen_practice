import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/features.dart';

abstract class AppRoutes {
  static const String welcome = '/';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String portfolio = '/portfolio';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.welcome,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.welcome,
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (BuildContext context, GoRouterState state) =>
            const AuthScreen(screenType: AuthScreenType.signIn),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (BuildContext context, GoRouterState state) =>
            const AuthScreen(screenType: AuthScreenType.signUp),
      ),
      GoRoute(
        path: AppRoutes.portfolio,
        builder: (BuildContext context, GoRouterState state) =>
            const PortfolioScreen(),
      ),
    ],
  );
}
