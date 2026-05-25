import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app.dart'; // Ensure correct path reference

void main() {
  testWidgets('App has a title and a splash screen', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const ProviderScope(child: App()),
    );

    // Assert
    expect(find.text('flutter_n8n_demo'), findsOneWidget);
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}