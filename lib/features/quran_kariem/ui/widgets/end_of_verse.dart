import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/config/themes/font_weight.dart';

import '../../../../core/methods/app_functions/app_functions.dart';
import '../../../../generated/assets.dart';

class EndOfVerse extends StatelessWidget {
  const EndOfVerse({super.key, required this.verse});
  final String verse;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.iconsEndOfVerse,
          height: 28.h,
          width: 28.w,
        ),
        Positioned(
          bottom: 5.h,
          child: Text(
            AppFunctions.convertNumberToArabic(verse),
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.black,
              fontWeight: FontWeightHelper.semiBold,
              fontFamily: 'Amiri',
            ),
          ),
        ),
      ],
    );
  }
}
