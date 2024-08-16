import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/features/quran/ui/widgets/play_pause_surah_button.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/app_variable.dart';

class VerseCount extends StatelessWidget {
  final int surahIndex;

  const VerseCount({
    super.key,
    required this.surahIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(AppLocalizations.of(context)!.theNumberOfItsVerses,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.regular,
                  color: AppColors.kWhiteColor,
                )),
        Text(
          AppVariable.quranSurahs[surahIndex]['ayahs'].toString(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.bold,
                color: AppColors.kWhiteColor,
              ),
        ),
        PlayPauseSurahButton(
          surahIndex: surahIndex + 1,
          verseIndices: _getVerseIndices(surahIndex + 1),
        ),
      ],
    );
  }

  List<int> _getVerseIndices(int surahIndex) {
    List<int> indices = [];
    for (int i = 1; i <= quran.getVerseCount(surahIndex); i++) {
      indices.add(i);
    }
    return indices;
  }
}
