import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/features/auth/data/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:myapp/src/core/theme/theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return AppBar(
      title: InkWell(
        onTap: () => context.go('/'),
        child: const Text(
          'EventPulse',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        const SizedBox(width: 24),
        if (user == null) ...[
          ElevatedButton(
            onPressed: () => context.go('/auth'),
            child: const Text('Sign In'),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: () => context.go('/auth'),
            child: const Text('Sign Up'),
          ),
        ] else
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthenticationService>().signOut();
              context.go('/');
            },
            tooltip: 'Logout',
          ),
        const SizedBox(width: 24),
        IconButton(
          icon: Icon(
            Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
          onPressed: () =>
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
          tooltip: 'Toggle Theme',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
