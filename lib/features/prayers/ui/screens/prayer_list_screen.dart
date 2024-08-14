import 'package:flutter/material.dart';

import '../../data/models/prayer_model.dart';
import '../widgets/prayer_item.dart';

class PrayerListScreen extends StatelessWidget {
  const PrayerListScreen({super.key, required this.prayers});
  final List<PrayerModel> prayers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prayers.first.title!),
      ),
      body: ListView.separated(
        itemCount: prayers.length,
        itemBuilder: (context, index) {
          final prayer = prayers[index];
          return PrayerItem(
            prayer: prayer,
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
