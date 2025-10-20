import 'package:go_router/go_router.dart';
import 'package:myapp/src/core/routing/go_router_refresh_stream.dart';
import 'package:myapp/src/features/auth/data/authentication_service.dart';
import 'package:myapp/src/features/auth/presentation/auth_page.dart';
import 'package:myapp/src/features/create_event/presentation/create_event_page.dart';
import 'package:myapp/src/features/dashboard/presentation/dashboard_page.dart';
import 'package:myapp/src/features/events/presentation/events_page.dart';
import 'package:myapp/src/features/gallery/presentation/gallery_page.dart';
import 'package:myapp/src/features/home/presentation/home_page.dart';
import 'package:myapp/src/widgets/scaffold_with_nested_navigation.dart';

class AppRouter {
  final AuthenticationService _authService;

  AppRouter(this._authService);

  late final GoRouter router = GoRouter(
    refreshListenable: GoRouterRefreshStream(_authService.userChanges),
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/events',
                builder: (context, state) => const EventsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/gallery',
                builder: (context, state) => const GalleryPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: '/create-event',
        builder: (context, state) => const CreateEventPage(),
      ),
    ],
    redirect: (context, state) {
      final user = _authService.currentUser;
      final isLoggingIn = state.matchedLocation == '/auth';

      if (user == null) {
        return isLoggingIn ? null : '/auth';
      }

      if (isLoggingIn) {
        return '/';
      }

      return null;
    },
  );
}
