import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/helpers/spacing.dart';
import 'package:muslim_app/features/home/ui/widgets/prayer_container.dart';

import '../../../../core/components/progress_indector.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'feature_item.dart';
import 'features.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    // Initialize the state
    context.read<HomeCubit>().position == null
        ? context.read<HomeCubit>().getLocation(context)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // Handle state changes
      },
      builder: (context, state) {
        return context.read<HomeCubit>().position != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const PrayerContainer(),
                    Spacing.verticalSpace(10),

                    // Constrain the height of the GridView to prevent overflow
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: featuredItems(context).length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 15,
                        childAspectRatio: .95,
                      ),
                      itemBuilder: (context, index) {
                        final feature = featuredItems(context)[index];

                        return index == 0
                            ? FeatureItem(
                                image: feature.image,
                                title: feature.title,
                                widget: feature.widget,
                                args: context.read<HomeCubit>().surahs,
                              )
                            : FeatureItem(
                                image: feature.image,
                                title: feature.title,
                                widget: feature.widget,
                              );
                      },
                    ),
                  ],
                ),
              )
            : const CustomLoadingIndicator();
      },
    );
  }
}
