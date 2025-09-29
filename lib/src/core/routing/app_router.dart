
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/features/dashboard/presentation/dashboard_page.dart';
import 'package:myapp/src/features/events/presentation/create_event_page.dart';
import 'package:myapp/src/features/events/presentation/events_page.dart';
import 'package:myapp/src/features/home/presentation/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/events', builder: (context, state) => const EventsPage()),
      GoRoute(
          path: '/create-event',
          builder: (context, state) => const CreateEventPage()),
      GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardPage()),
      // Additional routes...
    ],
  );
}
