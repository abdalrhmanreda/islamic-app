import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../logic/names_of_alluh_cubit.dart';

class FrontSide extends StatelessWidget {
  const FrontSide({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 15.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.kCircleAvatarColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.read<NamesOfAlluhCubit>().namesOfAlluh[index].nameOfAllah!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
          ),
        ],
      ),
    );
  }
}
