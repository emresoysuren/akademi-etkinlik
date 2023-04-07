import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;

  const SecondaryButton({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        enableFeedback: false,
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: ColorPalette.primaryButton, width: 3.2),
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorPalette.primaryButton,
          ),
        ),
      ),
    );
  }
}
