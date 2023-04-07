import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Base extends StatelessWidget {
  final Widget? appBar;
  final Widget? body;
  final Widget? bottom;
  final Color? backgroundColor;

  const Base(
      {super.key, this.appBar, this.body, this.bottom, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    List<Widget> scaffold = [];
    if (appBar != null) scaffold.add(appBar!);
    if (body != null) {
      scaffold.add(
          Expanded(child: Align(alignment: Alignment.topCenter, child: body)));
    } else {
      scaffold.add(const Spacer());
    }
    if (bottom != null) scaffold.add(bottom!);
    return BaseCore(
      backgroundColor: backgroundColor ?? ColorPalette.primaryBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: scaffold,
      ),
    );
  }
}

class BaseCore extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const BaseCore({super.key, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: DefaultTextStyle(
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: ColorPalette.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        child: child,
      ),
    );
  }
}
