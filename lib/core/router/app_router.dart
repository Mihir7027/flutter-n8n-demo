import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_n8n_demo/core/theme/app_theme.dart';
import '../features/coming_soon/presentation/coming_soon_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/coming-soon',
      builder: (context, state) => const ComingSoonScreen(),
    ),
  ],
);