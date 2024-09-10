import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../generated/assets.dart';

class NameOfSurah extends StatelessWidget {
  const NameOfSurah({
    super.key,
    required this.surah,
  });

  final int surah;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            Assets.images88802,
            width: MediaQuery.of(context).size.width,
            height: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.7, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: Text(
                textAlign: TextAlign.center,
                quran.getSurahNameArabic(surah),
                style: const TextStyle(
                  fontFamily: "hafc",
                  fontSize: 22,
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
