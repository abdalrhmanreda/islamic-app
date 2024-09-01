import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_divider.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';

class RookiaItem extends StatelessWidget {
  const RookiaItem({
    super.key,
    required this.rookieQuran,
  });

  final String rookieQuran;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      width: AppConstant.deviceWidth(context),
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.kCircleAvatarColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rookieQuran,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kButtonColor,
                  fontWeight: FontWeightHelper.regular,
                  fontSize: 18.sp,
                  fontFamily: 'amiri',
                  height: 2,
                ),
          ),
          Spacing.verticalSpace(15.h),
          myDivider(AppConstant.deviceWidth(context), 1),
          Row(
            children: [
              Transform.rotate(
                angle: -45,
                child: IconButton(
                  onPressed: () {
                    // share text
                    Share.share(rookieQuran);
                  },
                  icon: const Icon(Iconsax.direct_right_outline),
                ),
              ),
              IconButton(
                icon: const Icon(Iconsax.copy_outline),
                onPressed: () {
                  // copy text
                  Clipboard.setData(ClipboardData(text: rookieQuran));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context)!.rookiaCopyToClipboard,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.kWhiteColor),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
