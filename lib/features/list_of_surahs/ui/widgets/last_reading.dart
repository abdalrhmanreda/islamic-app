import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/core/components/custom_button.dart';
import 'package:muslim_app/core/helpers/extensions.dart';
import 'package:muslim_app/core/methods/get_responsive_text/responsive_text.dart';
import 'package:muslim_app/generated/assets.dart';
import 'package:quran/quran.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../quran_kariem/ui/screens/quran_kariem_screen.dart';
import '../screens/surahs_list.dart';

class LastReading extends StatelessWidget {
  const LastReading({
    super.key,
    required this.lastPage,
    required this.widget,
  });

  final int lastPage;
  final SurahsList widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      width: AppConstant.deviceWidth(context),
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            AppColors.kButtonColor.withOpacity(.7),
            AppColors.kButtonColor.withOpacity(.8),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                AppLocalizations.of(context)!.lastRead,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: getResponsiveFontSize(context, fontSize: 22),
                      fontWeight: FontWeightHelper.regular,
                      color: AppColors.kWhiteColor,
                    ),
              ),
              Text(
                '${AppLocalizations.of(context)!.surah} ${getSurahNameArabic(getPageData(lastPage)[0]['surah']) ?? 1}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: getResponsiveFontSize(context, fontSize: 18),
                      fontWeight: FontWeightHelper.regular,
                      color: AppColors.kWhiteColor,
                    ),
              ),
              Text(
                '${AppLocalizations.of(context)!.page} ${lastPage ?? 1}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      fontWeight: FontWeightHelper.regular,
                      color: AppColors.kWhiteColor,
                    ),
              ),
              SvgPicture.asset(
                getPlaceOfRevelation(getPageData(lastPage)[0]['surah']) ==
                        'Makkah '
                    ? Assets.iconsKaaba
                    : Assets.iconsMadina,
                width: 50.w,
                height: 50.h,
                color: AppColors.kWhiteColor,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                Assets.iconsQuranReading,
                width: 100.w,
                height: 100.h,
                color: AppColors.kWhiteColor,
              ),
              CustomButton(
                height: 40.h,
                color: AppColors.kWhiteColor,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      fontWeight: FontWeightHelper.semiBold,
                      color: AppColors.kButtonColor,
                    ),
                width: 150.w,
                onPressed: () {
                  context.navigateToWidget(
                    context,
                    QuranKariemScreen(
                      pageNumber: lastPage,
                      jsonData: widget.surahs,
                    ),
                  );
                },
                text: AppLocalizations.of(context)!.continueReading,
              ),
            ],
          )
        ],
      ),
    );
  }
}
