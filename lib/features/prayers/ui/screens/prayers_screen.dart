import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/components/custom_sliver_app_bar.dart';
import '../../../../core/components/progress_indector.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../../ahadith/ui/widgets/ahadith_item.dart';
import '../../logic/prayers_cubit.dart';
import '../../logic/prayers_state.dart';

class PrayersScreen extends StatelessWidget {
  const PrayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrayersCubit, PrayersState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: state is Loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomLoadingIndicator(),
                    Spacing.verticalSpace(15),
                    Text(AppLocalizations.of(context)!.waitPrayersLoading),
                  ],
                )
              : CustomScrollView(
                  slivers: [
                    CustomSliverAppBar(
                      title: AppLocalizations.of(context)!.prayers,
                      image: Assets.iconsHand,
                      description: AppLocalizations.of(context)!.prayersDes,
                    ),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return AhadithItem(
                            image: context
                                .read<PrayersCubit>()
                                .prayers(context)[index]
                                .image,
                            title: context
                                .read<PrayersCubit>()
                                .prayers(context)[index]
                                .title,
                            widget: RoutePath.prayersListScreen,
                            onTap: () {
                              context.navigateToWidgetByNamed(
                                  context, RoutePath.prayersListScreen,
                                  arguments: context
                                      .read<PrayersCubit>()
                                      .allPrayers[index]);
                            },
                          );
                        },
                        childCount: context
                            .read<PrayersCubit>()
                            .prayers(context)
                            .length,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
