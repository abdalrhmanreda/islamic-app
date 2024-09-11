import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/features/qibla/ui/widgets/qibla_aya.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/app_functions/direction_method.dart';
import '../../../../generated/assets.dart';
import '../screens/qibla_screen.dart';

class QiblaScreenBody extends StatelessWidget {
  const QiblaScreenBody({
    super.key,
    required this.qiblahDirection,
  });

  final QiblahDirection? qiblahDirection;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const QiblaAya(),
          Spacing.verticalSpace(20),
          SizedBox(
            height: 220.h,
            child: AnimatedBuilder(
              animation: animation!,
              builder: (context, child) => Transform.rotate(
                  angle: animation!.value,
                  child: SvgPicture.asset(Assets.iconsQibla)),
            ),
          ),
          Spacing.verticalSpace(25),
          Text(
            ' ${AppLocalizations.of(context)!.qibla} ${qiblahDirection!.direction.toInt()}° ${angleToCardinalDirection(qiblahDirection!.direction)}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
          ),
        ],
      ),
    );
  }
}
