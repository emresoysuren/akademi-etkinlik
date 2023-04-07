import 'package:akademi_etkinlik/pages/auth/auth.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  if (context.mounted) {
    Navigator.pushAndRemoveUntil(
      context,
      NonAnimatedPageRoute(
        builder: (context) => const AuthPage(),
      ),
      (route) => false,
    );
  }
}
