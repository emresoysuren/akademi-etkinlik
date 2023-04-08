import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/auth/login.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/secondary_button.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            const Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/appkademi.svg", height: 60),
                const SizedBox(width: 16),
                Text(
                  Config.title,
                  style: GoogleFonts.delaGothicOne(
                    textStyle: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset("assets/auth-bg.png"),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: "Giriş Yap",
                onPressed: () => Navigator.push(
                    context, SlidePageRoute(child: const LoginPage())),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: SecondaryButton(label: "Yardım"),
            ),
          ],
        ),
      ),
    );
  }
}
