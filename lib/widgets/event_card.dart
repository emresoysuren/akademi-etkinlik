import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/event/event.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/countdown.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool? show;
  final Function()? onPressed;

  const EventCard({super.key, this.show, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed?.call(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        curve: Curves.ease,
        height: show == true ? 170 : 80,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: ColorPalette.secondaryBackground,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: BaseCore(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.tiktok_rounded),
                            SizedBox(width: 4),
                            Text(
                              "Etkinlik",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: ColorPalette.primaryText,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "4/7/23 21:00",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.primaryText,
                          ),
                        ),
                      ],
                    ),
                    const CountDown(),
                  ],
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(
                      label: "Görüntüle",
                      onPressed: () => Navigator.push(
                        context,
                        SlidePageRoute(child: const EventPage(join: false,)),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.amber,
                              size: 20,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "3.86",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ColorPalette.primaryText,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(
                              Icons.people_alt_rounded,
                              color: ColorPalette.primaryItem,
                              size: 20,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "1.2k",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ColorPalette.primaryText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
