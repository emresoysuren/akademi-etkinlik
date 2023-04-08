import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';

class SingleButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? customBorder;
  final Color? color;
  final double? elevation;

  const SingleButton({
    super.key,
    required this.child,
    this.onPressed,
    this.padding,
    this.customBorder,
    this.color,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      elevation: elevation ?? 0,
      shape: customBorder ?? const CircleBorder(),
      child: InkWell(
        enableFeedback: false,
        customBorder: customBorder ?? const CircleBorder(),
        onTap: onPressed,
        child: Ink(
          child: Padding(
            padding: padding ?? const EdgeInsets.all(12),
            child: child,
          ),
        ),
      ),
    );
  }
}

class PopButton extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final double? size;
  final Color? backgroundColor;

  const PopButton({
    super.key,
    this.color,
    this.icon,
    this.size,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SingleButton(
      color: backgroundColor,
      onPressed: () => Navigator.of(context).pop(),
      child: Icon(
        icon ?? Icons.arrow_back_ios_new_rounded,
        size: size ?? 20,
        color: color ?? ColorPalette.primaryItem,
      ),
    );
  }
}
