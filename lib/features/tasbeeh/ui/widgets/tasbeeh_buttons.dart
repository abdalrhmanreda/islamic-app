import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/tasbeeh_cubit.dart';
import '../widgets/custom_animation_button.dart';
import '../widgets/small_button.dart';

class TasbeehButtons extends StatelessWidget {
  const TasbeehButtons({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${context.read<TasbeehCubit>().count}',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.kButtonColor,
                fontWeight: FontWeight.bold,
                fontSize: 50.sp,
                fontFamily: 'amiri',
              ),
        ),
        Spacing.verticalSpace(10),
        CustomAnimationButton(
          height: 150.h,
          width: 150.w,
          onPressed: () {
            context.read<TasbeehCubit>().increaseCount();
          },
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: AppColors.kGreyColor,
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
            gradient: LinearGradient(
              colors: [
                AppColors.kButtonColor.withOpacity(.5),
                AppColors.kButtonColor.withOpacity(.6),
                AppColors.kButtonColor.withOpacity(.7),
                AppColors.kButtonColor.withOpacity(.8),
              ],
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.tabeehButtonIncrease,
            style: TextStyle(
              fontSize: 25.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Spacing.verticalSpace(50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SmallButton(
              icon: Iconsax.arrow_right_1_outline,
              onTap: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
                context.read<TasbeehCubit>().decreaseCount();
              },
            ),
            SmallButton(
              icon: Iconsax.repeat_outline,
              onTap: () {
                context.read<TasbeehCubit>().decreaseCount();
              },
            ),
            SmallButton(
              icon: Iconsax.arrow_left_outline,
              onTap: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
                context.read<TasbeehCubit>().decreaseCount();
              },
            ),
          ],
        ),
      ],
    );
  }
}
