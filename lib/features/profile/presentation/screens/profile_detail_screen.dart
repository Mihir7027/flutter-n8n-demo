import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';
import '../widgets/logout_button.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Detail')), 
      body: Column(
        children: const [
          InfoTile(label: 'Email', value: 'user@example.com'),
          InfoTile(label: 'Gender', value: 'Not Specified'),
          LogoutButton(),
        ],
      ),
    );
  }
}