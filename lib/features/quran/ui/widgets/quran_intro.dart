import 'package:flutter/material.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../generated/assets.dart';

class QuranIntro extends StatelessWidget {
  const QuranIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstant.deviceWidth(context),
      height: AppConstant.deviceHeight(context) / 1.5,
      color: AppColors.kScaffoldLightColor,
      child: Image.asset(
        Assets.imagesQuranImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
