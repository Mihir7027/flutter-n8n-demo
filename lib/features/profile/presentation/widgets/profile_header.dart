import 'package:flutter/material.dart';

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