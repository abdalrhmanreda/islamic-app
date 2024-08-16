import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/themes/font_weight.dart';
import '../../logic/surah_details_cubit.dart';
import '../../logic/surah_details_state.dart';
import 'build_share_button.dart';
import 'play_pause_button.dart';

class ActionsRow extends StatelessWidget {
  final int surahIndex;
  final int verseIndex;

  const ActionsRow({
    super.key,
    required this.surahIndex,
    required this.verseIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurahDetailsCubit, SurahDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            BuildShareButton(
              surah: surahIndex,
              index: verseIndex,
            ),
            _buildCopyButton(context),
            PlayPauseButton(surahIndex: surahIndex, verseIndex: verseIndex),
            const Spacer(),
            _buildVerseIndexText(context),
          ],
        );
      },
    );
  }

  Widget _buildCopyButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        context
            .read<SurahDetailsCubit>()
            .copyToClipboard(context, surahIndex, verseIndex);
      },
      icon: const Icon(Iconsax.copy_outline),
    );
  }

  Widget _buildVerseIndexText(BuildContext context) {
    return Text(
      '$verseIndex',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
    );
  }
}
