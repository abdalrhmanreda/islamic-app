import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/cache/hive_cache.dart';
import '../widgets/custom_onboarding_body.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                HiveCache.saveData(key: 'onboarding', value: true)
                    .then((value) {
                  context.navigateToWidgetByNamed(
                      context, RoutePath.enableLocation);
                });
              },
              child: Text(
                AppLocalizations.of(context)!.onBoardingTextButtonText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                      color: AppColors.kPrimaryColor,
                    ),
              ),
            ),
          ),
        ],
      ),
      body: const CustomOnBoardingBody(),
    );
  }
}
