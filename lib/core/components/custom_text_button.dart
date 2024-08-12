import 'package:flutter/material.dart';

import '../../config/colors/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  final VoidCallback onPressed;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: Theme.of(context).textButtonTheme.style,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: fontSize,
              color: AppColors.kPrimaryColor,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
