import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import 'custom_animation_button.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomAnimationButton(
      width: 80.w,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.kCircleAvatarColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: AppColors.kLightGreyColor,
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      onPressed: onTap,
      child: Icon(
        icon,
      ),
    );
  }
}
