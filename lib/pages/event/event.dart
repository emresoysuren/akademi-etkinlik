import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/event/event_join.dart';
import 'package:akademi_etkinlik/pages/event/event_rate.dart';
import 'package:akademi_etkinlik/sub_pages/menus/event_mod_draggable_menu.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/plain_text_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:akademi_etkinlik/widgets/countdown.dart';
import 'package:akademi_etkinlik/widgets/expandable_text.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final bool? join;

  const EventPage({super.key, this.join});

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: "Etkinlik",
        popButton: true,
        children: [
          SingleButton(
            padding: const EdgeInsets.all(9),
            onPressed: () => DraggableMenu.open(
              context,
              barrier: true,
              const EventModDraggableMenu(),
            ),
            child: const Icon(
              Icons.more_horiz,
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ColoredBox(color: ColorPalette.secondaryBackground),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: ColorPalette.primaryBackground,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(32)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "4/7/23 21:00",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: ColorPalette.primaryText,
                                ),
                              ),
                              CountDown(),
                            ],
                          ),
                          const SizedBox(height: 16),
                          PlainTextButton(
                            icon: Icons.tiktok,
                            text: "TikTok",
                            backgroundColor: ColorPalette.secondaryItem,
                          ),
                          const SizedBox(height: 16),
                          const ExpandableText(
                            text:
                                "Enim mollit duis mollit reprehenderit laborum elit eiusmod deserunt esse sit velit sit elit. Incididunt qui officia magna id nulla. Exercitation magna commodo fugiat ut et. Exercitation commodo ex commodo eu occaecat est dolor fugiat mollit amet dolor nulla id proident. Veniam voluptate dolor minim culpa laborum veniam do commodo laborum do consequat duis ea elit. Adipisicing sit elit adipisicing aliquip anim do reprehenderit pariatur consectetur irure ea sunt velit sint.",
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PlainTextButton(
                                icon: Icons.star_rate_rounded,
                                iconColor: Colors.amber,
                                text: "3.86",
                                fontSize: 18,
                                onPressed: () {},
                              ),
                              PlainTextButton(
                                icon: Icons.people_alt_rounded,
                                text: "1.2k",
                                fontSize: 18,
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              label: join != false ? "Katıl" : "Değerlendir",
                              onPressed: () => Navigator.push(
                                context,
                                SlidePageRoute(
                                    child: join != false
                                        ? const EventJoinPage()
                                        : const EventRatePage()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Yorumlar:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ColorPalette.primaryText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: const [
                              CircleAvatar(
                                backgroundColor: ColorPalette.primaryBackground,
                                radius: 32,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
