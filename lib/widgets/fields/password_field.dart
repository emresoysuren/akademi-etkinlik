import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:akademi_etkinlik/widgets/fields/info_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String? label;
  final void Function(String? value)? onChanged;

  const PasswordField({super.key, this.label, this.onChanged});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InfoField(
          label: widget.label,
          obscureText: _obscureText,
          keyboardType: TextInputType.visiblePassword,
          onChanged: widget.onChanged,
        ),
        Positioned(
          right: 10,
          top: 0,
          bottom: 0,
          child: Material(color: Colors.transparent, child: showPassword()),
        ),
      ],
    );
  }

  showPassword() {
    return SingleButton(
      onPressed: () => setState(() {
        _obscureText = !_obscureText;
      }),
      child: _obscureText
          ? Icon(
              size: 20,
              Icons.visibility_off_rounded,
              color: ColorPalette.primaryItem.withOpacity(0.64),
            )
          : const Icon(
              size: 20,
              Icons.visibility_rounded,
              color: ColorPalette.primaryItem,
            ),
    );
  }
}
