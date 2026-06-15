import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/scientific_calculator/presentation/pages/calculator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      home: CalculatorPage(),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }

  final _routerDelegate = GoRouterDelegate(
    routes: [
      GoRoute(
        path: '/calculator',
        builder: (context, state) => CalculatorPage(),
      ),
    ],
  );

  final _routeInformationParser = GoRouterParser(
    routes: [
      GoRoute(
        path: '/calculator',
      ),
    ],
  );
}