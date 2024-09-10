import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:muslim_app/config/themes/text_styles.dart';
import 'package:muslim_app/features/home/data/model/feature_model.dart';
import 'package:muslim_app/features/zakat/ui/widgets/notes_part.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../widgets/zakat_title_and_image.dart';

class ValueOfZakat extends StatelessWidget {
  const ValueOfZakat({
    super.key,
    required this.zakatValue,
  });

  final double zakatValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.valueOfZakat,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: getResponsiveFontSize(context, fontSize: 20),
              ),
        ),
        Spacing.horizontalSpace(25),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.kCircleAvatarColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            zakatValue.toStringAsFixed(2), // Display zakat value
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                ),
          ),
        ),
      ],
    );
  }
}
