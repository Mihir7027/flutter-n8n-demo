import 'package:go_router/go_router.dart';
import '../route_names.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

final List<GoRoute> homeRoutes = [
  GoRoute(
    path: RouteNames.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RouteNames.profile,
    name: RouteNames.profile,
    builder: (context, state) => const ProfileScreen(),
  ),
];