import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/config/colors/app_colors.dart';
import 'package:muslim_app/core/components/progress_indector.dart';

import '../../../home/logic/home_cubit.dart';
import '../../../home/logic/home_state.dart';
import '../widgets/prayer_timing_item.dart';
import '../widgets/prayer_timings_app_bar.dart';

class PrayerTimingsScreen extends StatefulWidget {
  const PrayerTimingsScreen({super.key});

  @override
  State<PrayerTimingsScreen> createState() => _PrayerTimingsScreenState();
}

class _PrayerTimingsScreenState extends State<PrayerTimingsScreen> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // Handle any side effects or events based on state changes here
      },
      builder: (context, state) {
        return Scaffold(
          body: context.read<HomeCubit>().mainPrayerTimes != null
              ? CustomScrollView(
                  key: UniqueKey(),
                  slivers: [
                    const PrayerTimingsAppBar(),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DatePicker(
                          DateTime.now(),
                          locale: 'ar',
                          height: 95.h,
                          dateTextStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          dayTextStyle: TextStyle(
                            fontSize: 12.sp,
                          ),
                          initialSelectedDate:
                              context.read<HomeCubit>().currentDate,
                          selectionColor: AppColors.kPrimaryColor,
                          selectedTextColor: AppColors.kCircleAvatarColor,
                          onDateChange: (date) {
                            context.read<HomeCubit>().selectDay(date.day);
                            context
                                .read<HomeCubit>()
                                .getPrayerTimes(date: date);
                          },
                          width: 60.w,
                          daysCount: 7,
                          calendarType: CalendarType.gregorianDate,
                          deactivatedColor:
                              AppColors.kPrimaryColor.withOpacity(.5),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return PrayerTimingItem(
                            key: ValueKey(
                                index), // Use ValueKey instead of UniqueKey
                            index: index,
                          );
                        },
                        childCount:
                            context.read<HomeCubit>().prayers(context).length,
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CustomLoadingIndicator(),
                ),
        );
      },
    );
  }
}
