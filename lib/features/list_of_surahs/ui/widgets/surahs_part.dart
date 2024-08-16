import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';

// class SurahsPart extends StatelessWidget {
//   const SurahsPart({
//     super.key,
//     required this.surahs,
//   });
//   final List<Surah> surahs;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: EdgeInsets.only(
//         top: 10.h,
//       ),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: surahs.length,
//       itemBuilder: (context, index) => Container(
//         decoration: BoxDecoration(
//           color: AppColors.kWhiteColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         margin: const EdgeInsets.all(8),
//         padding: const EdgeInsets.all(15),
//         width: AppConstant.deviceWidth(context),
//         child: SurahListItem(surahs: surahs),
//       ),
//     );
//   }
// }

class SurahListItem extends StatelessWidget {
  const SurahListItem({
    super.key,
    required this.surahName,
    required this.numberOfAyahs,
    required this.englishName,
    required this.number,
  });

  final String surahName;
  final int numberOfAyahs;
  final String englishName;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              Assets.iconsEndOfVerse,
              width: 30.h,
              height: 30.h,
              colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor, BlendMode.srcIn),
            ),
            Text(
              '$number',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
            ),
          ],
        ),
        Spacing.horizontalSpace(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              surahName,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Amiri',
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
            ),
            Text(
              '$numberOfAyahs ${AppLocalizations.of(context)!.theNumberOfItsVerses}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              englishName,
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
