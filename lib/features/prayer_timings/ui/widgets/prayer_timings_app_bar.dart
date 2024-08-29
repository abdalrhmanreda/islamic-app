import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/config/routes/routes_path.dart';
import 'package:muslim_app/core/helpers/extensions.dart';
import 'package:muslim_app/generated/assets.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/app_functions/app_functions.dart';
import '../../../home/logic/home_cubit.dart';
import '../../../home/ui/widgets/counter.dart';

class PrayerTimingsAppBar extends StatelessWidget {
  const PrayerTimingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        AppLocalizations.of(context)!.prayerTimingsButton,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.kWhiteColor,
              fontWeight: FontWeightHelper.regular,
              fontSize: 18.sp,
            ),
      ),
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
                top: 50.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.homeContainerTitle}${AppFunctions.prayerTimeToString(context.read<HomeCubit>().getPrayerTimes().nextPrayer(), context)} ${AppLocalizations.of(context)!.onTime}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kWhiteColor,
                          fontWeight: FontWeightHelper.bold,
                          fontSize: 19.sp,
                        ),
                  ),
                  Spacing.verticalSpace(5),
                  Text(
                    DateFormat('hh:mm a')
                        .format(context.read<HomeCubit>().getNextPrayerTime())
                        .toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kWhiteColor,
                          fontWeight: FontWeightHelper.bold,
                          fontSize: 25.sp,
                        ),
                  ),
                  Spacing.verticalSpace(5),
                  CountdownText(
                    targetTime: context.read<HomeCubit>().getNextPrayerTime(),
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
