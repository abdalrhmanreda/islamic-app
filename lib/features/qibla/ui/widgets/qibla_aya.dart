import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';

class QiblaAya extends StatelessWidget {
  const QiblaAya({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 15.h,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 15.h,
      ),
      width: AppConstant.deviceWidth(context),
      decoration: BoxDecoration(
        color: AppColors.kCircleAvatarColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        quran.getVerse(2, 144),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18.sp,
              fontFamily: 'amiri',
            ),
      ),
    );
  }
}
