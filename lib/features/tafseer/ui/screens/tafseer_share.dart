import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/di/dependancy_injection.dart';
import 'package:muslim_app/features/tafseer/logic/tafseer_cubit.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../data/models/aya_tafseer_model.dart';
import '../../data/repo/tafseer_repo.dart';

class ShareTafseer extends StatelessWidget {
  const ShareTafseer({super.key, required this.ayaTafseer});
  final Result ayaTafseer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TafseerCubit(getIt<TafseerRepo>()),
      child: BlocConsumer<TafseerCubit, TafseerState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.kPrimaryColor,
              leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.kWhiteColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            backgroundColor: AppColors.kPrimaryColor,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RepaintBoundary(
                    key: context.read<TafseerCubit>().globalKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      color: AppColors.kPrimaryColor,
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
                                  ayaTafseer.translation!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18.sp,
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
                            text: AppLocalizations.of(context)!
                                .poweredByMuslimApp,
                          ),
                          Spacing.verticalSpace(10),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      context.read<TafseerCubit>().captureAndSharePng(
                            ayaTafseer.translation!,
                            ayaTafseer.id!,
                          );
                    },
                    edgeInsets: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: AppColors.kWhiteColor,
                        ),
                    color: Colors.teal,
                    text: AppLocalizations.of(context)!.share,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
