import 'package:alphamuscle/src/uiwidgets/auth/auth_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            Padding(
              padding: const EdgeInsets.only(bottom: 1.0, top: 10.0, left: 8.0, right: 8.0),
              child: ElevatedButton(onPressed: () => AuthCard.showAuthCard(context, AuthMode.signUp), child: const Text("Sign Up")),
            ),
            TextButton(onPressed: () => AuthCard.showAuthCard(context, AuthMode.signIn), child: const Text("Sign In"))
          ],
        ),
      ),
    );
  }

  
}
