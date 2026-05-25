import 'package:go_router/go_router.dart';
import '../../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../../core/router/route_names.dart';

final List<GoRoute> homeRoutes = <GoRoute>[
  // Other routes...
  GoRoute(
    path: RouteNames.profile,
    name: RouteNames.profile,
    builder: (context, state) => const ProfileScreen(),
  ),
];