import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;

  const PrimaryButton({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        enableFeedback: false,
        backgroundColor: onPressed == null
            ? const MaterialStatePropertyAll(
                ColorPalette.primaryButton,
              )
            : const MaterialStatePropertyAll(
                ColorPalette.primaryButton,
              ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
