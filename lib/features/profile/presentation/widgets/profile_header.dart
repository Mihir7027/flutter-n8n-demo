import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('https://example.com/profile_pic.png'),
        ),
        const SizedBox(height: 8),
        Text(
          'John Doe',
          style: Theme.of(context).textTheme.titleLarge, // Updated
        ),
        const SizedBox(height: 4),
        Text(
          'johndoe@example.com',
          style: Theme.of(context).textTheme.bodyMedium, // Updated
        ),
      ],
    );
  }
}
