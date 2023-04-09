import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Bar extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool? popButton;
  final List<Widget>? children;
  final Color? color;
  final Color? popButtonColor;
  final Color? backgroundColor;
  final bool? topSafeArea;
  final IconData? popIcon;
  final double? popSize;
  final double? fontSize;
  final double? secondaryFontSize;

  const Bar({
    super.key,
    required this.title,
    this.children,
    this.popButton,
    this.color,
    this.popButtonColor,
    this.backgroundColor,
    this.topSafeArea,
    this.popIcon,
    this.popSize,
    this.fontSize,
    this.subTitle,
    this.secondaryFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: topSafeArea != false,
      child: Stack(
        children: [
          DecoratedBox(
            decoration:
                BoxDecoration(color: backgroundColor ?? Colors.transparent),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 60),
              child: Padding(
                padding: popButton == true
                    ? const EdgeInsets.only(left: 54, right: 12)
                    : const EdgeInsets.only(left: 24, right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: subTitle == null
                          ? title.length < 17
                              ? Text(
                                  title,
                                  style: TextStyle(
                                    color: color ?? ColorPalette.primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize ?? 24,
                                  ),
                                )
                              : SizedBox(
                                  height: 60,
                                  child: Marquee(
                                    text: title,
                                    fadingEdgeEndFraction: 0.36,
                                    fadingEdgeStartFraction: 0.36,
                                    blankSpace: 36,
                                    velocity: 28,
                                    style: TextStyle(
                                      color: color ?? ColorPalette.primaryText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: fontSize ?? 24,
                                    ),
                                  ),
                                )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    color: color ?? ColorPalette.primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize ?? 20,
                                  ),
                                ),
                                Text(
                                  subTitle!,
                                  style: TextStyle(
                                    color: color ?? ColorPalette.primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: secondaryFontSize ?? 14,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    ...children ?? [],
                  ],
                ),
              ),
            ),
          ),
          if (popButton == true)
            Positioned(
              left: 3,
              top: 0,
              bottom: 0,
              child: PopButton(
                color: popButtonColor,
                icon: popIcon,
                size: popSize,
              ),
            )
        ],
      ),
    );
  }
}
