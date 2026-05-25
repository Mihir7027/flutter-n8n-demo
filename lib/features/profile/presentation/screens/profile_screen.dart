import 'package:flutter/material.dart';
import 'package:your_package_name/widgets/profile_header.dart';
import 'package:your_package_name/widgets/info_tile.dart';
import 'package:your_package_name/widgets/setting_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[],  // Modified to remove logout option
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const ProfileHeader(),
            const InfoTile(label: 'Email', value: 'user@example.com'),
            const SettingTile(label: 'Notifications', isEnabled: true),
            const SettingTile(label: 'Language', isEnabled: false),
          ],
        ),
      ),
    );
  }
}