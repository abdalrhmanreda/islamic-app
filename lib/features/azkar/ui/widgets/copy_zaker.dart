import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../data/models/zaker_mode.dart';
import '../../logic/azkar_cubit.dart';

class CopyZaker extends StatelessWidget {
  const CopyZaker({
    super.key,
    required this.zakerModel,
  });

  final ZakerModel zakerModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<AzkarCubit>().copyToClipboard(zakerModel.content!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.copyZakerInClipboard,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeightHelper.regular,
                    color: AppColors.kWhiteColor,
                    fontSize: 17.sp,
                  ),
            ),
          ),
        );
      },
      icon: const Icon(Iconsax.copy_outline),
    );
  }
}
