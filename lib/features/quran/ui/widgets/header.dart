import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/core/methods/app_functions/app_functions.dart';

import '../../../../config/themes/font_weight.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.index,
    required this.name,
    required this.juz,
  });

  final String name;
  final int index;
  final int juz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.w,
        left: 15.w,
        right: 15.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${AppLocalizations.of(context)!.juz} ${AppFunctions.getArabicOrdinal(juz)}',
            style: TextStyle(
              fontFamily: 'hafc',
              color: Colors.black,
              fontSize: 22.sp,
            ),
          ),
          Text(
            ArabicNumbers().convert(index),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.regular,
              fontFamily: 'Amiri',
              color: Colors.black,
            ),
          ),
          Text(
            '${AppLocalizations.of(context)!.surah} $name',
            style: TextStyle(
              fontFamily: 'hafc',
              color: Colors.black,
              fontSize: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
