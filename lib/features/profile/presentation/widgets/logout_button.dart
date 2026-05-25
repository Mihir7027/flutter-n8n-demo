import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/security/secure_storage.dart';  // For logout functionality
import '../../../../core/di/injection_container.dart';  // To access dependencies
import '../../../../core/router/route_names.dart';  // To navigate on completion

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Handle logout functionality
        await SecureStorage().deleteToken();
        Navigator.of(context).pushReplacementNamed(RouteNames.login);
      },
      child: const Text('Logout'),
    );
  }
}