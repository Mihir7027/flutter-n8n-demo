import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.label,
    required this.isEnabled,
    required this.onChanged,
    this.icon,
    this.subtitle,
  });

  final String label;
  final bool isEnabled;
  final ValueChanged<bool> onChanged;
  final IconData? icon;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SwitchListTile(
      secondary: icon != null
          ? Icon(icon, color: colorScheme.primary)
          : null,
      title: Text(label),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      value: isEnabled,
      onChanged: onChanged,
      activeColor: colorScheme.primary,
    );
  }
}
