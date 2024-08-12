import 'package:flutter/material.dart';

import '../../config/colors/app_colors.dart';

Widget myDivider(double width, double height) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.kGrayColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
    );
