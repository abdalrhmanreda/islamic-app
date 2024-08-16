import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/features/home/logic/home_state.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../home/logic/home_cubit.dart';

class PrayerTimingItem extends StatelessWidget {
  const PrayerTimingItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 10.w,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                context.read<HomeCubit>().prayers(context)[index].img,
                width: index == 5 ? 30.w : 40.w,
                height: index == 5 ? 30.h : 40.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              Spacing.horizontalSpace(15),
              Text(
                context.read<HomeCubit>().prayers(context)[index].prayerName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
              ),
              const Spacer(),
              Text(
                context.read<HomeCubit>().prayers(context)[index].prayerTime,
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
