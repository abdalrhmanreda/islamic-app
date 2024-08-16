import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_button.dart';
import '../../data/model/share_model.dart';
import '../../logic/surah_details_cubit.dart';
import '../../logic/surah_details_state.dart';
import '../widgets/share_container.dart';

class ShareAya extends StatelessWidget {
  const ShareAya({super.key, required this.shareModel});
  final ShareModel shareModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurahDetailsCubit, SurahDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.kPrimaryColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.kWhiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: AppColors.kPrimaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShareContainer(shareModel: shareModel),
              CustomButton(
                onPressed: () {
                  context.read<SurahDetailsCubit>().captureAndSharePng(
                        shareModel.surahName,
                      );
                },
                edgeInsets:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: AppColors.kWhiteColor,
                    ),
                color: Colors.teal,
                text: AppLocalizations.of(context)!.share,
              ),
            ],
          ),
        );
      },
    );
  }
}
