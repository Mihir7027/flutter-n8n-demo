import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_n8n_demo/core/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: appRouter,
    );
  }
}