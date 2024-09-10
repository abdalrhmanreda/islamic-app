import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';

class CalendarSliverAppBar extends StatelessWidget {
  const CalendarSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar'); // Set the local to Arabic
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'ar').format(DateTime.now());

    // Get the current date in Hijri
    String hijriDate =
        HijriCalendar.fromDate(DateTime.now()).toFormat("dd MMMM yyyy");
    return SliverAppBar(
      title: Text(
        AppLocalizations.of(context)!.calendar,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.kWhiteColor,
              fontWeight: FontWeightHelper.regular,
              fontSize: 18.sp,
            ),
      ),
      backgroundColor: AppColors.kPrimaryColor,
      pinned: true,
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.kWhiteColor,
        ),
        onPressed: () {
          context.navigateAndFinishNyNamed(context, RoutePath.layout);
        },
      ),
      expandedHeight: AppConstant.deviceHeight(context) / 3,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesPrayerTiming),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                top: 60.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.calendar,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kWhiteColor,
                          fontWeight: FontWeightHelper.bold,
                          fontSize: 19.sp,
                        ),
                  ),
                  Spacing.verticalSpace(5),
                  Text(
                    hijriDate,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kWhiteColor,
                          fontWeight: FontWeightHelper.bold,
                          fontSize: 19.sp,
                        ),
                  ),
                  Spacing.verticalSpace(5),
                  Text(
                    formattedDate,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kWhiteColor,
                          fontWeight: FontWeightHelper.bold,
                          fontSize: 19.sp,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: Container(
          width: AppConstant.deviceWidth(context),
          height: 35.h, // adjust the height if needed
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
