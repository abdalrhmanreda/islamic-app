import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:quran/quran.dart' as quran;

import '../../../../config/colors/app_colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../data/models/reciter_model.dart';

Future<dynamic> buildBottomSheetOfAvailableOfSurahList(
  BuildContext context,
  Reciter reciter,
  List<int> surahIndices,
  void Function(int index, String url) playAudio,
  Duration currentDuration,
  Duration totalDuration,
  bool isPlaying,
  VoidCallback stopAudio,
  ValueChanged<double> seekAudio,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Text(
                '${AppLocalizations.of(context)!.availableSurahsFor} ${reciter.name}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
              Spacing.verticalSpace(20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, surahIndex) {
                    final surah = reciter.moshaf[0];
                    final surahIndexFormatted =
                        surahIndices[surahIndex].toString().padLeft(3, '0');
                    return Column(
                      children: [
                        ListTile(
                          title: Text(quran
                              .getSurahNameArabic(surahIndices[surahIndex])),
                          subtitle: Text(
                              '${quran.getVerseCount(surahIndices[surahIndex])} ${AppLocalizations.of(context)!.theNumberOfItsVerses}'),
                          trailing: quran.getPlaceOfRevelation(
                                      surahIndices[surahIndex]) ==
                                  'Makkah'
                              ? SvgPicture.asset(Assets.iconsKaaba,
                                  width: 20.w,
                                  height: 20.h,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.kPrimaryColor,
                                    BlendMode.srcIn,
                                  ))
                              : SvgPicture.asset(Assets.iconsMadina,
                                  width: 20.w,
                                  height: 20.h,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.kPrimaryColor,
                                    BlendMode.srcIn,
                                  )),
                          onTap: () {
                            playAudio(
                              surahIndices[surahIndex],
                              '${surah.server}$surahIndexFormatted.mp3',
                            );
                          },
                        ),
                        if (isPlaying && currentDuration != Duration.zero)
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Column(
                              children: [
                                Slider(
                                  value: currentDuration.inSeconds.toDouble(),
                                  max: totalDuration.inSeconds.toDouble(),
                                  onChanged: (value) {
                                    seekAudio(value);
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                      onPressed: stopAudio,
                                    ),
                                    Text(
                                      '${currentDuration.inMinutes}:${(currentDuration.inSeconds % 60).toString().padLeft(2, '0')} / ${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                  itemCount: surahIndices.length,
                  separatorBuilder: (context, index) =>
                      Spacing.verticalSpace(10),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
