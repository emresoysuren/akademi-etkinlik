import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/comment.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/pages/event/event_join.dart';
import 'package:akademi_etkinlik/pages/event/event_rate.dart';
import 'package:akademi_etkinlik/pages/utils/timestamp_to_date_string.dart';
import 'package:akademi_etkinlik/pages/utils/to_now.dart';
import 'package:akademi_etkinlik/repository/comments_repo.dart';
import 'package:akademi_etkinlik/sub_pages/menus/event_mod_draggable_menu.dart';
import 'package:akademi_etkinlik/widgets/add_comment.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/plain_text_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:akademi_etkinlik/widgets/countdown.dart';
import 'package:akademi_etkinlik/widgets/disable_scroll_behavior.dart';
import 'package:akademi_etkinlik/widgets/expandable_text.dart';
import 'package:akademi_etkinlik/widgets/link_button.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:akademi_etkinlik/widgets/user_comment.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventPage extends ConsumerStatefulWidget {
  final Event event;

  const EventPage(this.event, {super.key});

  @override
  ConsumerState<EventPage> createState() => _EventPageState();
}

class _EventPageState extends ConsumerState<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: widget.event.title,
        popButton: true,
        children: [
          SingleButton(
            padding: const EdgeInsets.all(9),
            onPressed: () => DraggableMenu.open(
              context,
              barrier: true,
              EventModDraggableMenu(event: widget.event),
            ),
            child: const Icon(
              Icons.more_horiz,
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ColoredBox(color: ColorPalette.secondaryBackground),
          ),
          DisableScrollBehavior(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: ColorPalette.primaryBackground,
                    elevation: 4,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.event.date.toDateString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: ColorPalette.primaryText,
                                ),
                              ),
                              CountDown(widget.event.date),
                            ],
                          ),
                          const SizedBox(height: 16),
                          LinkButton(url: widget.event.link ?? ""),
                          const SizedBox(height: 28),
                          ExpandableText(text: widget.event.content),
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
                              label: widget.event.date.toNow().inDays > 0
                                  ? "Katıl"
                                  : "Değerlendir",
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  SlidePageRoute(
                                    child: widget.event.date.toNow().inDays > 0
                                        ? const EventJoinPage()
                                        : EventRatePage(event: widget.event),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 32),
                    child: FutureBuilder(
                      future: ref.watch(commentsRepo).get(widget.event),
                      builder: (context, snapshot) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data?.length ?? "0"} Yorum:",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ColorPalette.primaryText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                children: [
                                  const Material(
                                    elevation: 2,
                                    shape: CircleBorder(),
                                    child: CircleAvatar(
                                      backgroundColor:
                                          ColorPalette.primaryBackground,
                                      foregroundImage:
                                          AssetImage("assets/user-avatar.png"),
                                      radius: 32,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: AddComment(
                                      event: widget.event,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (snapshot.data != null)
                              for (Comment c in snapshot.data!)
                                UserComment(comment: c, event: widget.event),
                          ],
                        );
                      },
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
