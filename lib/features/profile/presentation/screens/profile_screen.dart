import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/profile_header.dart';
import '../widgets/information_section.dart';
import '../widgets/settings_section.dart';
import '../../../domain/models/user_profile.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mocked user profile data
    final userProfile = UserProfile(
      name: "John Doe",
      email: "john.doe@example.com",
      phoneNumber: "1234567890",
      gender: "Male",
      dateOfBirth: DateTime(1990, 1, 1).toString(),
      location: "New York, USA",
      profession: "Software Developer",
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')), 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProfileHeader(name: userProfile.name, email: userProfile.email),
            InformationSection(
              phoneNumber: userProfile.phoneNumber,
              gender: userProfile.gender,
              dateOfBirth: userProfile.dateOfBirth,
              location: userProfile.location,
              profession: userProfile.profession,
            ),
            SettingsSection(),
          ],
        ),
      ),
    );
  }
} 