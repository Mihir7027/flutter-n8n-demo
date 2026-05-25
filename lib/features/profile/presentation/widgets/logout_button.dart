import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/security/secure_storage.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/router/route_names.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await sl<SecureStorage>().deleteToken();
        Navigator.of(context).pushReplacementNamed(RouteNames.login);
      },
      child: const Text('Logout'),
    );
  }
}