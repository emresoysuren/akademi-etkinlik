import 'package:akademi_etkinlik/pages/auth/login.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      body: Center(
        child: PrimaryButton(
          label: "Giriş Yap",
          onPressed: () => Navigator.push(
            context,
            NonAnimatedPageRoute(
              builder: (context) => const LoginPage(),
            ),
          ),
        ),
      ),
    );
  }
}
