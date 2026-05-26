import 'package:flutter/foundation.dart';

@immutable
class ProfileModel {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String bio;
  final String avatarUrl;
  final String jobTitle;
  final String company;
  final String website;
  final String joinDate;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.bio,
    required this.avatarUrl,
    required this.jobTitle,
    required this.company,
    required this.website,
    required this.joinDate,
  });
}

/// Hardcoded dummy instance used across the profile feature.
const ProfileModel dummyProfile = ProfileModel(
  name: 'Alexandra Reynolds',
  email: 'alex.reynolds@example.com',
  phone: '+1 (555) 867-5309',
  location: 'San Francisco, CA',
  bio: 'Senior Flutter developer passionate about clean architecture, '
      'great UX, and open-source contributions.',
  avatarUrl: 'https://i.pravatar.cc/300?img=47',
  jobTitle: 'Senior Mobile Engineer',
  company: 'Acme Corp',
  website: 'alexreynolds.dev',
  joinDate: 'March 2021',
);
