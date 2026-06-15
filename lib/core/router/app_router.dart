import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_app_name/features/calculator/presentation/coming_soon_page.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final WidgetRef _ref;

  AppRouter(this._ref);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        const MaterialPage(child: ComingSoonPage()),
      ],
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
