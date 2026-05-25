import 'package:go_router/go_router.dart';
import 'route_names.dart';
import 'routes/home_routes.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    ...homeRoutes,
  ],
);
