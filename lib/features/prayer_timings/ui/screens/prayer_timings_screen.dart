import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/config/colors/app_colors.dart';
import 'package:muslim_app/core/components/progress_indector.dart';
import 'package:muslim_app/features/prayer_timings/logic/prayer_cubit.dart';

import '../widgets/prayer_timing_item.dart';
import '../widgets/prayer_timings_app_bar.dart';

class PrayerTimingsScreen extends StatefulWidget {
  const PrayerTimingsScreen({super.key});

  @override
  State<PrayerTimingsScreen> createState() => _PrayerTimingsScreenState();
}

class _PrayerTimingsScreenState extends State<PrayerTimingsScreen> {
  DateTime selectedDate = DateTime.now()  ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerCubit()..getPrayerTimes(date: selectedDate),
      child: BlocConsumer<PrayerCubit, PrayerState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final prayerCubit = context.read<PrayerCubit>();
          final prayerTimes = prayerCubit.prayerTimes;
          final prayers = prayerCubit.prayers(context);

          return Scaffold(
            body: prayerTimes != null
                ? CustomScrollView(
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
                      initialSelectedDate: selectedDate,
                      selectionColor: AppColors.kPrimaryColor,
                      selectedTextColor: AppColors.kCircleAvatarColor,
                      onDateChange: (date) {
                        setState(() {
                          selectedDate = date;
                          prayerCubit.getPrayerTimes(date: selectedDate);
                        });
                      },
                      width: 60.w,
                      daysCount: 7,
                      calendarType: CalendarType.gregorianDate,
                      deactivatedColor: AppColors.kPrimaryColor.withOpacity(.5),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return PrayerTimingItem(
                        key: ValueKey(index),
                        index: index,
                      );
                    },
                    childCount: prayers.length,
                  ),
                ),
              ],
            )
                : const Center(
              child: CustomLoadingIndicator(),
            ),
          );
        },
      ),
    );
  }
}
