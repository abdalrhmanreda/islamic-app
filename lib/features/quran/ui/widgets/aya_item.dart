import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_divider.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/model/surah_model.dart';
import '../../logic/surah_details_cubit.dart';
import '../../logic/surah_details_state.dart';
import 'actions_row.dart';

class AyaItem extends StatelessWidget {
  const AyaItem({
    super.key,
    required this.index,
    required this.surahModel,
  });

  final int index;
  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurahDetailsCubit, SurahDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVerseText(context),
            Spacing.verticalSpace(15),
            _buildDivider(context),
            Spacing.verticalSpace(15),
            _buildTranslationText(context),
            Spacing.verticalSpace(15),
            _buildDivider(context),
            Spacing.verticalSpace(15),
            ActionsRow(
              surahIndex: surahModel.index + 1,
              verseIndex: index + 1,
            ), // Use the new ActionsRow widget
          ],
        );
      },
    );
  }

  Widget _buildVerseText(BuildContext context) {
    return Text(
      'context.read<SurahDetailsCubit>().arabicAyahs[index]',
      textAlign: TextAlign.start,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeightHelper.regular,
            fontFamily: 'amiri',
            height: 2.2,
          ),
    );
  }

  Widget _buildTranslationText(BuildContext context) {
    return Text(
      'context.read<SurahDetailsCubit>().englishAyahs[index]',
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
      style: GoogleFonts.aBeeZee(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.regular,
        height: 2,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return myDivider(AppConstant.deviceWidth(context), 1);
  }
}
