import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/route_names.dart';
import '../../../../shared/widgets/error_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[IconButton(onPressed: () => context.go(RouteNames.logout), icon: const Icon(Icons.logout))],
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

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder
          ),
          const SizedBox(height: 8.0),
          const Text('User Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('user@example.com', style: TextStyle(fontSize: 16)),
          ElevatedButton(onPressed: () {}, child: const Text('Edit Profile')),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({Key? key, required this.label, required this.value}) : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

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