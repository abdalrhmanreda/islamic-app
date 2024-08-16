import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/app_variable.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../data/model/surah_model.dart';

class SurahInfo extends StatelessWidget {
  final SurahModel surah;

  const SurahInfo({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppVariable.quranSurahs[surah.index]['arabic'],
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeightHelper.semiBold,
                color: AppColors.kWhiteColor,
              ),
        ),
        Spacing.verticalSpace(15),
        Text(
          AppVariable.quranSurahs[surah.index]['english'],
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.semiBold,
                color: AppColors.kWhiteColor,
              ),
        ),
        Spacing.verticalSpace(15),
        SvgPicture.asset(
          quran.getPlaceOfRevelation(surah.index + 1) == 'Makkah'
              ? Assets.iconsKaaba
              : Assets.iconsMadina,
          width: 40.w,
          colorFilter: const ColorFilter.mode(
            AppColors.kWhiteColor,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
