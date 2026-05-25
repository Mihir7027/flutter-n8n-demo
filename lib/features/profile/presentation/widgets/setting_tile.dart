import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;

  const SettingTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Handle tap action
      },
    );
  }
}