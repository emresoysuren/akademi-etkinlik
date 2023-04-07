import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';

class PlainTextButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color;
  final IconData? icon;
  final bool? reversed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? fontSize;
  final Color? iconColor;

  const PlainTextButton({
    super.key,
    this.text,
    this.onPressed,
    this.color,
    this.icon,
    this.reversed,
    this.padding,
    this.backgroundColor,
    this.fontSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      if (icon != null)
        Icon(
          icon,
          size: 20,
          color: iconColor ?? color ?? ColorPalette.primaryItem,
        ),
      if (icon != null) const SizedBox(width: 4),
      Text(
        text ?? "",
        textWidthBasis: TextWidthBasis.longestLine,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color ?? ColorPalette.primaryText,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
    return SingleButton(
      color: backgroundColor,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: reversed == true ? children.reversed.toList() : children,
      ),
    );
  }
}
