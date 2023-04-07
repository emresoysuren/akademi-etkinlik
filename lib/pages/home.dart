import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:akademi_etkinlik/widgets/event_card.dart';
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
            padding: const EdgeInsets.all(11),
            onPressed: () {},
            child: const Icon(
              Icons.settings,
              size: 26,
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
