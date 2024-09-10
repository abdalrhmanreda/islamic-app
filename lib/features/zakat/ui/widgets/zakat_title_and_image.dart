import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/core/helpers/spacing.dart';
import 'package:muslim_app/core/methods/get_responsive_text/responsive_text.dart';
import 'package:muslim_app/features/home/data/model/feature_model.dart';

class ZakatTitleAndImagePart extends StatelessWidget {
  const ZakatTitleAndImagePart({
    super.key,
    required this.featureModel,
  });

  final FeatureModel featureModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              featureModel.image,
              width: 40.w,
              height: 40.h,
            ),
            Spacing.horizontalSpace(10),
            Text(
              '${AppLocalizations.of(context)!.calculateZakat} ${featureModel.title}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 20),
                  ),
            ),
          ],
        ),
        Spacing.verticalSpace(10),
        Text(
          AppLocalizations.of(context)!.fillTheFields,
        ),
      ],
    );
  }
}
