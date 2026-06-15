import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';

class ComingSoonPage extends ConsumerWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming Soon'),
      ),
      body: Center(
        child: Text(
          'The calculator feature is coming soon.',
          style: AppTheme.textTheme.headline6,
        ),
      ),
    );
  }
}