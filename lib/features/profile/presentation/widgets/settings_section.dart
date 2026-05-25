import 'package:flutter/material.dart';
import 'setting_tile.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SettingTile(
            title: "Notifications",
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          SettingTile(
            title: "Dark Mode",
            trailing: Switch(value: MediaQuery.of(context).platformBrightness == Brightness.dark, onChanged: (val) {
              // Handle theme change
            }),
          ),
          SettingTile(
            title: "Language",
            onTap: () {}, // Navigate to language settings
          ),
          SettingTile(
            title: "Privacy Policy",
            onTap: () {}, // Navigate to privacy policy
          ),
          SettingTile(
            title: "Help & Support",
            onTap: () {}, // Navigate to help & support
          ),
          SettingTile(
            title: "Logout",
            onTap: () {
              // Handle logout with confirmation dialog
            },
          ),
        ],
      ),
    );
  }
} 