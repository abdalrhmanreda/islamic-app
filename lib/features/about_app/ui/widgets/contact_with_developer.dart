import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/methods/url_lunch/url_lunch.dart';

class ContactWithDeveloper extends StatelessWidget {
  const ContactWithDeveloper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppConstant.deviceWidth(context),
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.contectWithDeveloper,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.kWhiteColor,
                ),
          ),
        ),
        Container(
          width: AppConstant.deviceWidth(context),
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  launchUrlMethod(
                      link:
                          'https://www.facebook.com/profile.php?id=100009576528529');
                },
                icon: const Icon(
                  Bootstrap.facebook,
                ),
              ),
              IconButton(
                onPressed: () {
                  launchUrlMethod(link: 'https://wa.me/+2001098584630');
                },
                icon: const Icon(
                  Bootstrap.whatsapp,
                ),
              ),
              IconButton(
                onPressed: () {
                  launchUrlMethod(
                      link:
                          'https://www.linkedin.com/in/abdalrhman-reda-3b3b3b1b4/');
                },
                icon: const Icon(
                  Bootstrap.linkedin,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await launchUrlMethod(
                      link: 'https://www.instagram.com/abdalrhman_red3/');
                },
                icon: const Icon(
                  Bootstrap.instagram,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await launchUrlMethod(
                      link: 'https://github.com/abdalrhmanreda');
                },
                icon: const Icon(
                  Bootstrap.github,
                ),
              ),
              IconButton(
                onPressed: () {
                  launchUrlMethod(link: 'https://abdalrhman-reda.web.app/');
                },
                icon: const Icon(
                  Bootstrap.globe_americas,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
