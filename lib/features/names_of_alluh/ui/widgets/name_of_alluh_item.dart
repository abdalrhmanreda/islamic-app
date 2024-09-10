import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';

class NameOfAlluhItem extends StatelessWidget {
  const NameOfAlluhItem({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 15.h,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.kCircleAvatarColor,
            child: SvgPicture.asset(
              image,
              height: 30.w,
            ),
          ),
        ),
        Spacing.verticalSpace(5),
        Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
          textAlign: TextAlign.center, // Center-aligns the text
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeightHelper.medium,
              ),
        ),
      ],
    );
  }
}
