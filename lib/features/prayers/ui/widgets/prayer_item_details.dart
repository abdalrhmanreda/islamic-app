import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_divider.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/prayer_model.dart';
import '../../logic/prayers_cubit.dart';
import '../../logic/prayers_state.dart';

class PrayerItemDetails extends StatelessWidget {
  const PrayerItemDetails({super.key, required this.prayer});
  final PrayerContentModel prayer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrayersCubit, PrayersState>(
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
                prayer.arabicText!.replaceAll('(', '').replaceAll(')', ''),
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
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle copy to clipboard
                      Clipboard.setData(
                          ClipboardData(text: prayer.arabicText!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!.prayerCopyToClipboard,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeightHelper.regular,
                                  color: AppColors.kWhiteColor,
                                  fontSize: 17.sp,
                                ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Iconsax.copy_outline,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    prayer.repeat!.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kButtonColor,
                          fontWeight: FontWeightHelper.regular,
                          fontSize: 17.sp,
                          height: 2,
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
