import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/constant/app_constant.dart';

class TasbeehItem extends StatelessWidget {
  const TasbeehItem({
    super.key,
    required this.tasbeeh,
    required this.count,
    required this.description,
  });

  final String tasbeeh;
  final int count;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 245.h,
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          width: AppConstant.deviceWidth(context),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.kCircleAvatarColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tasbeeh,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kButtonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      fontFamily: 'amiri',
                      height: 1.7,
                    ),
              ),
              Text(
                '$count ${AppLocalizations.of(context)!.often}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kButtonColor,
                      fontWeight: FontWeightHelper.regular,
                      fontFamily: 'amiri',
                      fontSize: 18,
                    ),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kButtonColor,
                      fontWeight: FontWeightHelper.regular,
                      fontFamily: 'amiri',
                      fontSize: 19.sp,
                      height: 2,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
