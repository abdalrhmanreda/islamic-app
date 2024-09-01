import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:muslim_app/core/helpers/extensions.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../config/routes/routes_path.dart';
import '../../../../core/helpers/app_variable.dart';
import '../../data/model/share_model.dart';

class BuildShareButton extends StatelessWidget {
  const BuildShareButton({super.key, required this.surah, required this.index});

  final int surah;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -45,
      child: IconButton(
        onPressed: () => context.navigateToWidgetByNamed(
          context,
          RoutePath.shareAya,
          arguments: ShareModel(
            surahName: quran.getSurahNameArabic(surah),
            surahText: quran.getVerse(surah, index),
            totalAyahs: AppVariable.quranSurahs[index]['ayahs'],
            surahTextEn: quran.getVerseTranslation(
              surah,
              index,
              translation: quran.Translation.enSaheeh,
            ),
          ),
        ),
        icon: const Icon(Iconsax.direct_right_outline),
      ),
    );
  }
}
