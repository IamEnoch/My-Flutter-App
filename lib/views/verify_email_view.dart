import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text(
              "We`ve sent you an email verification. Please open it it to verify"),
          const Text('If you have not received press the button below'),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                print(user?.email.toString());
              },
              child: const Text('Send email verification')),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Restart'))
        ],
      ),
    );
  }
}
