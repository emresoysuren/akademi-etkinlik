import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoField extends StatelessWidget {
  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;
  final bool? autofocus;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final bool? isSecondary;
  final String? initialValue;
  final bool? obscureText;

  const InfoField({
    super.key,
    this.label,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.onChanged,
    this.autofocus,
    this.color,
    this.isSecondary,
    this.initialValue,
    this.textColor,
    this.hintColor,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
      decoration: isSecondary == true
          ? BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                color: color ?? ColorPalette.primaryItem,
                width: 1.6,
              ),
            )
          : BoxDecoration(
              color: color ?? ColorPalette.secondaryBackground,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
      child: TextFormField(
        obscureText: obscureText == true,
        keyboardType: keyboardType,
        cursorColor: textColor ?? ColorPalette.primaryText,
        cursorWidth: 1,
        autofocus: autofocus ?? false,
        initialValue: initialValue,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: textColor ?? ColorPalette.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: hintColor ?? ColorPalette.secondaryText,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          errorStyle: const TextStyle(height: 0),
          isDense: true,
          border: InputBorder.none,
        ),
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
      ),
    );
  }
}
