import 'package:go_router/go_router.dart';
import '../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../features/calculator/presentation/screens/calculator_screen.dart';
import '../../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../../core/router/route_names.dart';

final List<GoRoute> homeRoutes = <GoRoute>[
  GoRoute(
    path: RouteNames.home,
    name: RouteNames.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RouteNames.calculator,
    name: RouteNames.calculator,
    builder: (context, state) => const CalculatorScreen(),
  ),
  GoRoute(
    path: RouteNames.profile,
    name: RouteNames.profile,
    builder: (context, state) => const ProfileScreen(),
  ),
];