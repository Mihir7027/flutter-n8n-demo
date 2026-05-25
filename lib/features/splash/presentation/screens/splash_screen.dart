import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder logic
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).go(RouteNames.home);
      }
    });
    return Scaffold(
      body: Center(child: Text('Splash Screen')), 
    );
  }
}