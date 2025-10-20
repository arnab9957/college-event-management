import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/core/routing/app_router.dart';
import 'package:myapp/src/core/theme/app_theme.dart';
import 'package:myapp/src/core/theme/theme_provider.dart';
import 'package:myapp/src/features/auth/data/authentication_service.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthenticationService _authService;
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _authService = AuthenticationService();
    _appRouter = AppRouter(_authService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        Provider<AuthenticationService>.value(value: _authService),
        StreamProvider<User?>.value(
          value: _authService.userChanges,
          initialData: _authService.currentUser,
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, __) {
          return MaterialApp.router(
            routerConfig: _appRouter.router,
            title: 'EventPulse',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
          );
        },
      ),
    );
  }
}
