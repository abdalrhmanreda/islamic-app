import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/font_weight.dart';
import '../../data/model/on_boarding_item_content.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingItemContent onBoardingItemContent;
  final BuildContext context;
  const OnBoardingItem({
    super.key,
    required this.onBoardingItemContent,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SvgPicture.asset(
          onBoardingItemContent.image,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Text(
            onBoardingItemContent.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.regular,
                  height: 1.5,
                ),
          ),
        ),
      ],
    );
  }
}
