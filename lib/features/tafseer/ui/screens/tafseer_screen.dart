import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/components/custom_sliver_app_bar.dart';
import '../../../../core/di/dependancy_injection.dart';
import '../../../../core/helpers/app_variable.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../data/repo/tafseer_repo.dart';
import '../../logic/tafseer_cubit.dart';
import '../widgets/tafseer_list_item.dart';

class TafseerScreen extends StatelessWidget {
  const TafseerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TafseerCubit(getIt<TafseerRepo>()),
      child: BlocConsumer<TafseerCubit, TafseerState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                CustomSliverAppBar(
                  title: AppLocalizations.of(context)!.explanationButton,
                  image: Assets.iconsExplanation,
                  description: AppLocalizations.of(context)!.explanationScreen,
                ),
                SliverList.separated(
                  itemCount: AppVariable.quranSurahs.length,
                  itemBuilder: (context, index) => TafseerListItem(
                    index: index,
                  ),
                  separatorBuilder: (context, index) =>
                      Spacing.verticalSpace(10),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
//https://quranenc.com/api/v1/
///translation/sura/arabic_moyassar/$index
