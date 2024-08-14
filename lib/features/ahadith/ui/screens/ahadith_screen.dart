import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../core/components/custom_sliver_app_bar.dart';
import '../../../../generated/assets.dart';
import '../../logic/ahadith_cubit.dart';
import '../../logic/ahadith_state.dart';
import '../widgets/ahadith_item.dart';
import 'ahadith_details_screen.dart';

class AhadithScreen extends StatelessWidget {
  const AhadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AhadithCubit, AhadithState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(
                  title: AppLocalizations.of(context)!.ahadithBooks,
                  image: Assets.iconsHadisDetails,
                  description:
                      AppLocalizations.of(context)!.ahadithBooksDescription,
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return AhadithItem(
                          image: context
                              .read<AhadithCubit>()
                              .ahadithBooks(context)[index]
                              .image,
                          title: context
                              .read<AhadithCubit>()
                              .ahadithBooks(context)[index]
                              .title,
                          widget: context
                              .read<AhadithCubit>()
                              .ahadithBooks(context)[index]
                              .widget,
                          onTap: () {
                            context.navigateToWidget(
                              context,
                              AhadithDetailsScreen(
                                title: context
                                    .read<AhadithCubit>()
                                    .ahadithBooks(context)[index]
                                    .title,
                                imamModel: context
                                    .read<AhadithCubit>()
                                    .imams(context)[index],
                              ),
                            );
                          });
                    },
                    childCount: context
                        .read<AhadithCubit>()
                        .ahadithBooks(context)
                        .length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
