import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:muslim_app/core/helpers/spacing.dart';
import 'package:muslim_app/core/methods/get_responsive_text/responsive_text.dart';
import 'package:muslim_app/features/home/data/model/feature_model.dart';

import '../../../../config/colors/app_colors.dart';

class NotesPart extends StatelessWidget {
  const NotesPart({
    super.key,
    this.isGold,
  });
  final bool? isGold;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.info_circle_bold,
              color: AppColors.kPrimaryColor,
            ),
            Spacing.horizontalSpace(10),
            Text(
              '${AppLocalizations.of(context)!.notes}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 20),
                  ),
            ),
          ],
        ),
        Spacing.verticalSpace(15),
        Text(
            isGold!
                ? AppLocalizations.of(context)!.notesGold
                : AppLocalizations.of(context)!.notesZakat,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: getResponsiveFontSize(context, fontSize: 15),
                )),
      ],
    );
  }
}
