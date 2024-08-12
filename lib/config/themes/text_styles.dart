import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import 'font_weight.dart';

class TextStyles {
  static TextStyle font30Black700Weight = TextStyle(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w700,
    fontSize: 30.sp,
  );

  static TextStyle font30BlueBold = TextStyle(
    color: AppColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 29.sp,
    height: 1.4,
  );

  static TextStyle font14Gray = TextStyle(
    color: AppColors.kGreyColor,
    fontSize: 14.sp,
  );
  static TextStyle font24BlueBold = TextStyle(
    color: AppColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
  );

  static TextStyle font14GrayRegular = TextStyle(
    color: AppColors.kGreyColor,
    fontWeight: FontWeightHelper.regular,
    fontSize: 14.sp,
  );

  static TextStyle font13GrayRegular = TextStyle(
    color: AppColors.kGreyColor,
    fontWeight: FontWeightHelper.regular,
    fontSize: 14.sp,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    color: AppColors.kDarkBlueColor,
    fontWeight: FontWeightHelper.medium,
    fontSize: 14.sp,
  );

  static TextStyle font13BlueRegular = TextStyle(
    color: AppColors.kPrimaryColor,
    fontWeight: FontWeightHelper.regular,
    fontSize: 13.sp,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    color: AppColors.kWhiteColor,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 16.sp,
  );

  static TextStyle font13BlueSemiBold = TextStyle(
    color: AppColors.kPrimaryColor,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 13.sp,
  );

  static TextStyle font19BlackBold = TextStyle(
    color: AppColors.kBlackColor,
    fontWeight: FontWeightHelper.bold,
    fontSize: 19.sp,
  );
}
