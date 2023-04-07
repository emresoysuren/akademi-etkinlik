import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? color;
  final double? radius;
  final double? borderWidth;
  final Color? textColor;

  const SecondaryButton({
    super.key,
    this.onPressed,
    required this.label,
    this.color,
    this.radius,
    this.borderWidth,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        enableFeedback: false,
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
                color: color ?? ColorPalette.primaryButton,
                width: borderWidth ?? 3.2),
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 32),
            ),
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor ?? ColorPalette.primaryButton,
          ),
        ),
      ),
    );
  }
}
