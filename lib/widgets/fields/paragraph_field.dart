import 'dart:math';
import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParagraphField extends StatelessWidget {
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;
  final bool? autofocus;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final String? initialValue;
  final Color? backgroundColor;

  const ParagraphField({
    super.key,
    this.hint,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.autofocus,
    this.color,
    this.initialValue,
    this.textColor,
    this.hintColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 92,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(
              color: color ?? ColorPalette.primaryItem,
              width: 1.6,
            ),
          ),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            cursorColor: textColor ?? ColorPalette.primaryText,
            cursorWidth: 1,
            autofocus: autofocus ?? false,
            expands: true,
            maxLines: null,
            initialValue: initialValue,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: textColor ?? ColorPalette.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            decoration: InputDecoration(
              hintText: hint,
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
        ),
        Positioned(
          bottom: 6,
          right: 8,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.rotate(
                angle: pi * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 16,
                    width: 1.6,
                    child: ColoredBox(
                      color: color ?? ColorPalette.primaryItem,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Transform.rotate(
                angle: pi * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 8,
                    width: 1.6,
                    child: ColoredBox(
                      color: color ?? ColorPalette.primaryItem,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
