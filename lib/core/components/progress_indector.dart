import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../config/colors/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: [
            AppColors.kPrimaryColor,
          ],
        ),
      ),
    );
  }
}
