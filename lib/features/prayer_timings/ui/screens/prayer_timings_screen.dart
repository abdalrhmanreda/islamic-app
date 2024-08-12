import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/progress_indector.dart';
import '../../../home/logic/home_cubit.dart';
import '../../../home/logic/home_state.dart';
import '../widgets/prayer_timing_item.dart';
import '../widgets/prayer_timings_app_bar.dart';

class PrayerTimingsScreen extends StatelessWidget {
  const PrayerTimingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Schedule notifications when the screen is built

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: state is Loading
              ? const Center(child: CustomLoadingIndicator())
              : CustomScrollView(
                  slivers: [
                    const PrayerTimingsAppBar(),
                    SliverList(
                      key: UniqueKey(), // Ensure SliverList has a unique key
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return PrayerTimingItem(
                            index: index,
                          );
                        },
                        childCount:
                            context.read<HomeCubit>().prayers(context).length,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
