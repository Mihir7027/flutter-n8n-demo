import 'package:go_router/go_router.dart';
import '../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../core/router/route_names.dart';

final List<GoRoute> homeRoutes = [
  GoRoute(
    path: RouteNames.home,
    builder: (context, state) => const HomeScreen(),
  ),
];
