import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/config/user.dart';
import 'package:akademi_etkinlik/firebase_options.dart';
import 'package:akademi_etkinlik/pages/auth/auth.dart';
import 'package:akademi_etkinlik/pages/home.dart';
import 'package:akademi_etkinlik/repository/events_repo.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _firebaseInit();
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

  Future<void> _firebaseInit() async {
    Future minDuration = Future.delayed(Duration.zero);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await ref.read(events).getEvents();
    await minDuration;
    if (FirebaseAuth.instance.currentUser != null) UserConfig.adminCheck();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        NonAnimatedPageRoute(
          builder: (context) => (FirebaseAuth.instance.currentUser != null)
              ? const HomePage()
              : const AuthPage(),
        ),
      );
    }
  }
}
