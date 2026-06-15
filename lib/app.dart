import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_app_name/core/router/app_router.dart';
import 'package:your_app_name/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Your App Name',
      theme: AppTheme.lightTheme,
      routerDelegate: AppRouter(ref),
      routeInformationParser: AppRouter(ref).defaultRouteParser(),
    );
  }
}