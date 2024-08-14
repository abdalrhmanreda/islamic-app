import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/prayer_model.dart';

class PrayerItem extends StatelessWidget {
  const PrayerItem({
    super.key,
    required this.prayer,
  });

  final PrayerModel prayer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event if needed.
        context.navigateToWidgetByNamed(
          context,
          RoutePath.prayerScreenDetails,
          arguments: prayer,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 15.w,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 10.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: AppConstant.deviceWidth(context) / 1.5),
              child: Text(
                prayer.title!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeightHelper.regular,
                    ),
              ),
            ),
            Spacing.verticalSpace(5),
            Text(
              prayer.category ?? 'Unknown Category',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.kGreyColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
