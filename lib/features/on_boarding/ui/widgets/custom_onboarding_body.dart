import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../core/cache/hive_cache.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_smooth_indicator.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../data/model/on_boarding_item_content.dart';
import 'on_boarding_item.dart';

class CustomOnBoardingBody extends StatefulWidget {
  const CustomOnBoardingBody({super.key});

  @override
  State<CustomOnBoardingBody> createState() => _CustomOnBoardingBodyState();
}

class _CustomOnBoardingBodyState extends State<CustomOnBoardingBody> {
  List<OnBoardingItemContent> getItems(BuildContext context) {
    return [
      OnBoardingItemContent(
        description: AppLocalizations.of(context)!.onBoardingDescription1,
        image: Assets.onBoardingOnBorading,
      ),
      OnBoardingItemContent(
        description: AppLocalizations.of(context)!.onBoardingDescription2,
        image: Assets.onBoardingOnBorading2,
      ),
      OnBoardingItemContent(
        description: AppLocalizations.of(context)!.onBoardingDescription3,
        image: Assets.onBoardingOnBorading3,
      ),
    ];
  }

// Usage
  PageController pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: _onPageChanged,
              controller: pageController,
              itemCount: getItems(context).length,
              itemBuilder: (context, index) => OnBoardingItem(
                onBoardingItemContent: getItems(context)[index],
                context: context,
              ),
            ),
          ),
          CustomSmoothIndicator(
              pageController: pageController, count: getItems(context).length),
          Spacing.verticalSpace(20),
          CustomButton(
            onPressed: () {
              if (isLast) {
                HiveCache.saveData(key: 'onboarding', value: true)
                    .then((value) {
                  context.navigateToWidgetByNamed(
                      context, RoutePath.enableLocation);
                });
              } else {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.fastEaseInToSlowEaseOut);
              }
            },
            text: AppLocalizations.of(context)!.onBoardingButtonText,
            width: MediaQuery.of(context).size.width / 2,
            radius: 15,
            color: AppColors.kPrimaryColor,
          ),
        ],
      ),
    );
  }

  void _onPageChanged(index) {
    if (index == getItems(context).length - 1) {
      setState(() {
        isLast = true;
      });
    } else {
      setState(() {
        isLast = false;
      });
    }
  }
}
