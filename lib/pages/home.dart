import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/sub_pages/menus/main_draggable_menu.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:akademi_etkinlik/widgets/event_card.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: Config.title,
        children: [
          SingleButton(
            onPressed: () {},
            padding: const EdgeInsets.all(9),
            child: const Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
          SingleButton(
            padding: const EdgeInsets.all(9),
            onPressed: () => DraggableMenu.open(
              context,
              barrier: true,
              const MainDraggableMenu(),
            ),
            child: const Icon(
              Icons.more_horiz,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            EventCard(
              show: currentIndex == 0,
              onPressed: () => setState(() => currentIndex = 0),
            ),
            const SizedBox(height: 24),
            EventCard(
              show: currentIndex == 1,
              onPressed: () => setState(() => currentIndex = 1),
            ),
            const SizedBox(height: 24),
            EventCard(
              show: currentIndex == 2,
              onPressed: () => setState(() => currentIndex = 2),
            ),
            const SizedBox(height: 24),
            EventCard(
              show: currentIndex == 3,
              onPressed: () => setState(() => currentIndex = 3),
            ),
          ],
        ),
      ),
    );
  }
}
