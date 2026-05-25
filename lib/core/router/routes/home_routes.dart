import 'package:go_router/go_router.dart';
import '../route_names.dart';
import '../../../features/home/presentation/screens/home_screen.dart';

final homeRoutes = <RouteBase>[
  GoRoute(
    path: RouteNames.home,
    name: RouteNames.home,
    builder: (context, state) => const HomeScreen(),
  ),
];
