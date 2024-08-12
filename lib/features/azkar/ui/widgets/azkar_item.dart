import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_divider.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/app_functions/app_functions.dart';
import '../../data/models/zaker_mode.dart';
import '../../logic/azkar_cubit.dart';
import '../../logic/azkar_state.dart';
import 'copy_zaker.dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem({
    super.key,
    required this.zakerModel,
    required this.index,
  });

  final ZakerModel zakerModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, AzkarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          width: AppConstant.deviceWidth(context),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.kCircleAvatarColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                zakerModel.content!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kButtonColor,
                      fontWeight: FontWeightHelper.regular,
                      fontSize: 17.sp,
                      fontFamily: 'amiri',
                      height: 2,
                    ),
              ),
              Spacing.verticalSpace(15.h),
              myDivider(AppConstant.deviceWidth(context), 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<AzkarCubit>().addToFavorite(
                                AppFunctions.zakerCategory(
                                    zakerModel.category!),
                                index,
                              );
                        },
                        icon: context.watch<AzkarCubit>().isFavorite(index)
                            ? const Icon(
                                Iconsax.heart_bold,
                                color: AppColors.kPrimaryColor,
                              )
                            : const Icon(Iconsax.heart_outline),
                      ),
                      CopyZaker(zakerModel: zakerModel),
                    ],
                  ),
                  Text(
                    zakerModel.count!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kButtonColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'amiri',
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
