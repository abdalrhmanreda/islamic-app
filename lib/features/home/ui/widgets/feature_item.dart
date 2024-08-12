import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    required this.image,
    required this.title,
    required this.widget,
    this.args,
  });
  final String image;
  final String title;
  final String widget;

  final dynamic args;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateToWidgetByNamed(context, widget, arguments: args);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.w,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 10.w,
        ),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: (AppColors.kWhiteColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: (AppColors.kCircleAvatarColor),
              child: SvgPicture.asset(
                image,
                height: 40.h,
              ),
            ),
            Spacing.verticalSpace(15),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
