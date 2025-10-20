import 'package:flutter/material.dart';
import 'package:myapp/src/features/auth/presentation/widgets/auth_card.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 400, 
            child: const AuthCard(),
          ),
        ),
      ),
    );
  }
}
