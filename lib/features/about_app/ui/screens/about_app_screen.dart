import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/core/methods/url_lunch/url_lunch.dart';

import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_divider.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/contact_with_developer.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.info,
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.appName,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
            ),
            Spacing.verticalSpace(10.h),
            Text(
              AppLocalizations.of(context)!.shareAppDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            Spacing.verticalSpace(10.h),
            // CustomButton(
            //   width: AppConstant.deviceWidth(context) / 2,
            //   onPressed: () {},
            //   text: AppLocalizations.of(context)!.shareApp,
            // ),
            SizedBox(
              height: 47.h,
              width: AppConstant.deviceWidth(context) / 2,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  side: BorderSide(
                    style: BorderStyle.solid,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () {
                  launchUrlMethod(link: 'https://forms.gle/noEzDzNYBDYS6kfQ6');
                },
                child: Text(
                  AppLocalizations.of(context)!.rateApp,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
              ),
            ),
            Spacing.verticalSpace(30.h),
            myDivider(AppConstant.deviceWidth(context), 2),
            Spacing.verticalSpace(40.h),
            const ContactWithDeveloper(),
          ],
        ),
      ),
    );
  }
}
