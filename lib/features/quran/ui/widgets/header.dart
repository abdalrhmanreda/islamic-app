import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran/quran.dart';

import '../../../../config/colors/app_colors.dart';
import '../screens/surah_details_screen.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.widget,
    required this.index,
  });

  final SurahDetailsScreen widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 2,
        left: 5.w,
        right: 5.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Icon(
                Iconsax.arrow_right_1_outline,
                size: 24.sp,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
          Text(
            '${AppLocalizations.of(context)!.surah} ${widget.jsonData[getPageData(index)[0]['surah'] - 1].name}',
            style: TextStyle(
              fontFamily: 'uthmanic',
              fontSize: 22.sp,
            ),
          ),
          Center(
            child: Icon(
              Iconsax.setting_2_outline,
              size: 24.sp,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
