import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/profile_header.dart';
import '../widgets/info_tile.dart';
import '../widgets/setting_tile.dart';
import '../../data/models/profile_model.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class ProfileSettingsState {
  final bool notificationsEnabled;
  final bool darkModeEnabled;
  final bool twoFactorEnabled;

  const ProfileSettingsState({
    this.notificationsEnabled = true,
    this.darkModeEnabled = false,
    this.twoFactorEnabled = true,
  });

  ProfileSettingsState copyWith({
    bool? notificationsEnabled,
    bool? darkModeEnabled,
    bool? twoFactorEnabled,
  }) {
    return ProfileSettingsState(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
    );
  }
}

class ProfileSettingsNotifier extends StateNotifier<ProfileSettingsState> {
  ProfileSettingsNotifier() : super(const ProfileSettingsState());

  void toggleNotifications(bool value) =>
      state = state.copyWith(notificationsEnabled: value);

  void toggleDarkMode(bool value) =>
      state = state.copyWith(darkModeEnabled: value);

  void toggleTwoFactor(bool value) =>
      state = state.copyWith(twoFactorEnabled: value);
}

final StateNotifierProvider<ProfileSettingsNotifier, ProfileSettingsState>
    profileSettingsProvider =
    StateNotifierProvider<ProfileSettingsNotifier, ProfileSettingsState>(
  (StateNotifierProviderRef<ProfileSettingsNotifier, ProfileSettingsState> ref) =>
      ProfileSettingsNotifier(),
);

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileSettingsState settings = ref.watch(profileSettingsProvider);
    final ProfileSettingsNotifier notifier =
        ref.read(profileSettingsProvider.notifier);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 0,
            floating: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Profile'),
            centerTitle: true,
          ),

          SliverToBoxAdapter(
            child: ProfileHeader(profile: dummyProfile),
          ),

          // ---- Bio section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'About',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dummyProfile.bio,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.75),
                  height: 1.5,
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: _SectionDivider()),

          // ---- Contact Information
          SliverToBoxAdapter(
            child: _SectionHeader(title: 'Contact Information', theme: theme),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: theme.colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: <Widget>[
                  const InfoTile(
                    icon: Icons.email_outlined,
                    label: 'EMAIL',
                    value: dummyProfile.email,
                  ),
                  _TileDivider(),
                  const InfoTile(
                    icon: Icons.phone_outlined,
                    label: 'PHONE',
                    value: dummyProfile.phone,
                  ),
                  _TileDivider(),
                  const InfoTile(
                    icon: Icons.location_on_outlined,
                    label: 'LOCATION',
                    value: dummyProfile.location,
                  ),
                  _TileDivider(),
                  const InfoTile(
                    icon: Icons.language_outlined,
                    label: 'WEBSITE',
                    value: dummyProfile.website,
                  ),
                  _TileDivider(),
                  const InfoTile(
                    icon: Icons.calendar_today_outlined,
                    label: 'MEMBER SINCE',
                    value: dummyProfile.joinDate,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: _SectionDivider()),

          // ---- Preferences
          SliverToBoxAdapter(
            child: _SectionHeader(title: 'Preferences', theme: theme),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: theme.colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SettingTile(
                    icon: Icons.notifications_outlined,
                    label: 'Push Notifications',
                    subtitle: 'Receive alerts and reminders',
                    isEnabled: settings.notificationsEnabled,
                    onChanged: notifier.toggleNotifications,
                  ),
                  _TileDivider(),
                  SettingTile(
                    icon: Icons.dark_mode_outlined,
                    label: 'Dark Mode',
                    subtitle: 'Switch to dark theme',
                    isEnabled: settings.darkModeEnabled,
                    onChanged: notifier.toggleDarkMode,
                  ),
                  _TileDivider(),
                  SettingTile(
                    icon: Icons.lock_outline,
                    label: 'Two-Factor Authentication',
                    subtitle: 'Extra layer of account security',
                    isEnabled: settings.twoFactorEnabled,
                    onChanged: notifier.toggleTwoFactor,
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: _SectionDivider()),

          // ---- Account / Danger zone
          SliverToBoxAdapter(
            child: _SectionHeader(title: 'Account', theme: theme),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: theme.colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: theme.colorScheme.error,
                    ),
                    title: Text(
                      'Log Out',
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  _TileDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.delete_outline,
                      color: theme.colorScheme.error,
                    ),
                    title: Text(
                      'Delete Account',
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private helper widgets
// ---------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.theme,
  });

  final String title;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 24);
  }
}

class _TileDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 16,
      endIndent: 16,
      color: Theme.of(context).colorScheme.outline.withOpacity(0.15),
    );
  }
}
