import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../data/model/share_model.dart';
import '../../logic/surah_details_cubit.dart';

class ShareContainer extends StatelessWidget {
  const ShareContainer({
    super.key,
    required this.shareModel,
  });

  final ShareModel shareModel;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: context.read<SurahDetailsCubit>().globalKey,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        color: AppColors.kPrimaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: AppConstant.deviceWidth(context) * 0.9,
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.logoLogo,
                      width: 100.w,
                      height: 100.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.kPrimaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    Spacing.verticalSpace(20),
                    Text(
                      '${AppLocalizations.of(context)!.surah} ${shareModel.surahName}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacing.verticalSpace(10),
                    Text(
                      '${AppLocalizations.of(context)!.theNumberOfItsVerses} ${shareModel.totalAyahs}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeightHelper.regular,
                            color: AppColors.kGreyColor,
                          ),
                    ),
                    Spacing.verticalSpace(10),
                    Text(
                      shareModel.surahText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeightHelper.regular,
                            fontFamily: 'amiri',
                          ),
                    ),
                  ],
                ),
              ),
              Spacing.verticalSpace(10),
              CustomButton(
                onPressed: () {},
                text: AppLocalizations.of(context)!.poweredByMuslimApp,
              ),
              Spacing.verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
