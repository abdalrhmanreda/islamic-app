import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/helpers/app_variable.dart';
import '../../../../generated/assets.dart';
import '../screens/tafseer_details.dart';

class TafseerListItem extends StatelessWidget {
  const TafseerListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppVariable.quranSurahs[index]['arabic']),
      subtitle: Row(
        children: [
          Text(
            ' ${AppLocalizations.of(context)!.theNumberOfItsVerses} ${AppVariable.quranSurahs[index]['ayahs'].toString()}',
          ),
        ],
      ),
      trailing: AppVariable.quranSurahs[index]['type'] == 'Makkiyah'
          ? SvgPicture.asset(
              Assets.iconsKaaba,
              width: 22.w,
              height: 22.h,
              colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor, BlendMode.srcIn),
            )
          : SvgPicture.asset(
              Assets.iconsMadina,
              width: 22.w,
              height: 22.h,
              colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor, BlendMode.srcIn),
            ),
      onTap: () {
        context.navigateToWidget(
          context,
          TafseerDetails(
            index: index + 1,
            surah: AppVariable.quranSurahs[index]['arabic'],
          ),
        );
      },
    );
  }
}
