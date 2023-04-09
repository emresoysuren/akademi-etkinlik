import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/config/user.dart';
import 'package:akademi_etkinlik/pages/home.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/fields/info_field.dart';
import 'package:akademi_etkinlik/widgets/fields/password_field.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool _buttonActive = false;

  @override
  Widget build(BuildContext context) {
    return Base(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Bar(
            title: "Giriş Yap",
            popButton: true,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              16 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "${Config.title}'ye Giriş Yap",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.primaryText,
                    ),
                  ),
                  const SizedBox(height: 24),
                  InfoField(
                    label: "Email Adresi",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        _email = value ?? "";
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  PasswordField(
                    label: "Şifre",
                    onChanged: (value) {
                      _password = value ?? "";
                      if (value == null || value.isEmpty) {
                        if (_buttonActive) {
                          _buttonActive = false;
                        }
                      } else if (!_buttonActive) {
                        setState(() {
                          _buttonActive = true;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: "Giriş Yap",
                      onPressed: _buttonActive
                          ? () {
                              final form = _fromKey.currentState;
                              if (form == null) return;
                              if (form.validate() == true) {
                                _login();
                              }
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        await UserConfig.adminCheck();
        if (mounted) {
          Navigator.pushReplacement(
            context,
            NonAnimatedPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      } catch (e) {
        // TODO: Add errors
      }
    }
  }
}
