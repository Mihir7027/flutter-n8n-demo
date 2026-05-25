import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/route_names.dart';
import '../widgets/info_tile.dart';
import '../widgets/profile_header.dart';
import '../widgets/setting_tile.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ProfileHeader(),
            InfoTile(title: 'Email', value: 'user@example.com'),
            InfoTile(title: 'Gender', value: 'Not Specified'),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}