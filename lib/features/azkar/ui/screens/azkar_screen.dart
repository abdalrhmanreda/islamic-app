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
import '../../logic/azkar_cubit.dart';
import '../../logic/azkar_state.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, AzkarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: state is Loading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomLoadingIndicator(),
                      Spacing.verticalSpace(15),
                      Text(AppLocalizations.of(context)!.waitAzkarLoading)
                    ],
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    CustomSliverAppBar(
                      title: AppLocalizations.of(context)!.remembranceButton,
                      image: Assets.iconsMoon,
                      description: AppLocalizations.of(context)!.azkarDesc,
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
                                .read<AzkarCubit>()
                                .azkar(context)[index]
                                .image,
                            title: context
                                .read<AzkarCubit>()
                                .azkar(context)[index]
                                .title,
                            widget: RoutePath.azkarDetailsScreen,
                            onTap: () {
                              context.navigateToWidgetByNamed(
                                context,
                                RoutePath.azkarDetailsScreen,
                                arguments:
                                    context.read<AzkarCubit>().allAzkar[index],
                              );
                            },
                          );
                        },
                        childCount: 5,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
