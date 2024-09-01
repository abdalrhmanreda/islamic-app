import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/prayer_cubit.dart';

class PrayerTimingItem extends StatelessWidget {
  const PrayerTimingItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrayerCubit, PrayerState>(
      listener: (context, state) {
        // Handle state changes if needed
      },
      builder: (context, state) {
        final prayerCubit = context.read<PrayerCubit>();
        final prayerTimes = prayerCubit.prayerTimes;
        final prayers = prayerCubit.prayers(context);

        // Ensure prayerTimes and prayers are not null
        if (prayerTimes == null || prayers.isEmpty) {
          return const SizedBox
              .shrink(); // Return an empty widget if data is not available
        }

        // Get the corresponding prayer time based on the index
        String? prayerTime;
        switch (index) {
          case 0:
            prayerTime = prayerTimes.fajr.toString();
            break;
          case 1:
            prayerTime = prayerTimes.sunrise.toString();
            break;
          case 2:
            prayerTime = prayerTimes.dhuhr.toString();
            break;
          case 3:
            prayerTime = prayerTimes.asr.toString();
            break;
          case 4:
            prayerTime = prayerTimes.maghrib.toString();
            break;
          case 5:
            prayerTime = prayerTimes.isha.toString();
            break;
          default:
            prayerTime = '';
        }

        // Format the prayer time
        final formattedTime =
            DateFormat('hh:mm a').format(DateTime.parse(prayerTime).toLocal());

        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 10.w,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                prayers[index].img,
                width: index == 5 ? 30.w : 40.w,
                height: index == 5 ? 30.h : 40.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              Spacing.horizontalSpace(15),
              Text(
                prayers[index].prayerName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
              ),
              const Spacer(),
              Text(
                formattedTime,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
