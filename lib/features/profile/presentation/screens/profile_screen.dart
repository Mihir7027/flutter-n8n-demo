import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/profile_header.dart';
import '../widgets/info_section.dart';
import '../widgets/setting_tile.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')), 
      body: RefreshIndicator(
        onRefresh: () async {
          // Add your refresh logic
        },
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const ProfileHeader(),
            const SizedBox(height: 16),
            const InfoSection(),
            const SizedBox(height: 16),
            const Text('Settings', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            const SettingTile(title: 'Notifications'),
            const SettingTile(title: 'Dark Mode'),
            const SettingTile(title: 'Language'),
            const SettingTile(title: 'Privacy Policy'),
            const SettingTile(title: 'Help & Support'),
            const SettingTile(title: 'Logout'),
          ],
        ),
      ),
    );
  }
}