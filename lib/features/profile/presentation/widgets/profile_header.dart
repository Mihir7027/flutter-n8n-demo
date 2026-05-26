import 'package:flutter/material.dart';
import '../../data/models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.profile,
    this.onEditPressed,
  });

  final ProfileModel profile;
  final VoidCallback? onEditPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: colorScheme.onPrimary.withOpacity(0.3),
            child: CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(profile.avatarUrl),
              onBackgroundImageError: (Object exception, StackTrace? stackTrace) {},
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            profile.name,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            profile.jobTitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onPrimary.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            profile.company,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onPrimary.withOpacity(0.70),
            ),
          ),
          const SizedBox(height: 16.0),
          OutlinedButton.icon(
            onPressed: onEditPressed ?? () {},
            icon: const Icon(Icons.edit_outlined, size: 16),
            label: const Text('Edit Profile'),
            style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.onPrimary,
              side: BorderSide(
                color: colorScheme.onPrimary.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
