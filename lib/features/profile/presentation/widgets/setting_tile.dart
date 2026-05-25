import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({Key? key, required this.label, required this.isEnabled}) : super(key: key);
  final String label;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(label),
      value: isEnabled,
      onChanged: (bool value) {},
    );
  }
}