import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/app_functions/app_functions.dart';
import '../../../../generated/assets.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'counter.dart';

class PrayerContainer extends StatelessWidget {
  const PrayerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        PrayerTimes prayerTimes = context.read<HomeCubit>().getPrayerTimes();
        var next = prayerTimes.nextPrayer();
        var nextPrayerTime = prayerTimes.timeForPrayer(next)!.toLocal();
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
          width: AppConstant.deviceWidth(context),
          height: AppConstant.deviceHeight(context) / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                AppColors.kButtonColor.withOpacity(.7),
                AppColors.kButtonColor.withOpacity(.8),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                Assets.logoLogo,
                width: 100.w,
                height: 100.h,
                color: AppColors.kWhiteColor,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.homeContainerTitle}${AppFunctions.prayerTimeToString(next, context)} ${AppLocalizations.of(context)!.onTime}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kWhiteColor,
                            fontWeight: FontWeightHelper.bold,
                            fontSize: 19.sp,
                          ),
                    ),
                    Spacing.verticalSpace(15),
                    Text(
                      DateFormat('hh:mm a').format(nextPrayerTime).toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kWhiteColor,
                            fontWeight: FontWeightHelper.bold,
                            fontSize: 25.sp,
                          ),
                    ),
                    Spacing.verticalSpace(10),
                    CountdownText(
                      targetTime: nextPrayerTime,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
