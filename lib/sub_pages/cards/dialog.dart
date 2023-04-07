import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/secondary_button.dart';
import 'package:flutter/material.dart';

class DialogCard extends StatelessWidget {
  final String title;
  final String text;
  final String buttonText;
  final Function()? buttonPress;

  const DialogCard({
    super.key,
    required this.title,
    required this.text,
    required this.buttonText,
    this.buttonPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Center(
        child: BaseCore(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: ColorPalette.primaryBackground,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        color: ColorPalette.primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorPalette.primaryText,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: SecondaryButton(
                        color: Colors.red,
                        textColor: Colors.red,
                        label: buttonText,
                        onPressed: buttonPress,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
