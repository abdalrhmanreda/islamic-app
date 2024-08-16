import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import '../../data/model/surah_model.dart';
import '../../logic/surah_details_cubit.dart';
import '../../logic/surah_details_state.dart';
import 'surah_info.dart';
import 'verse_count.dart';

class ContainerSurahItem extends StatelessWidget {
  const ContainerSurahItem({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahDetailsCubit, SurahDetailsState>(
      builder: (context, state) {
        return _buildUI(context, state);
      },
    );
  }

  Widget _buildUI(BuildContext context, SurahDetailsState state) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      width: AppConstant.deviceWidth(context),
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            AppColors.kButtonColor.withOpacity(.7),
            AppColors.kButtonColor.withOpacity(.8),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SurahInfo(surah: surah),
          VerseCount(surahIndex: surah.index),
        ],
      ),
    );
  }
}
