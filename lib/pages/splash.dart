import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Config.title,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            LoadingAnimationWidget.discreteCircle(
              color: Colors.blue,
              size: 32,
              secondRingColor: Colors.red,
              thirdRingColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
