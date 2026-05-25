import 'package:go_router/go_router.dart';
import 'routes/home_routes.dart';
import 'route_names.dart';

class AppRouter {
  static GoRouter get router {
    return GoRouter(
      routes: [
        ...homeRoutes,
        GoRoute(
          path: RouteNames.home,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}
