import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Placeholder for now
          shadowColor: Colors.black.withOpacity(0.2),
          elevation: 4,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          email,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to edit profile
          },
          child: const Text('Edit Profile'),
        ),
      ],
    );
  }
} 