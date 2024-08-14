import 'package:audioplayers/audioplayers.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/progress_indector.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/radio_cubit.dart';
import '../widgets/radio_list_view.dart';
import '../widgets/reciter_list_view.dart';
import '../widgets/search_reciter_part.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isRecitersView = true; // Toggle state

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit()..getReciters(),
      child: BlocConsumer<RadioCubit, RadioState>(
        listener: (context, state) {
          // TODO: implement listener if necessary
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.audio,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 20.0),
                // VideoItem(state: state),
                ToggleSwitch(
                  minWidth: AppConstant.deviceWidth(context) * .8,
                  cornerRadius: 20.0,
                  radiusStyle: true,
                  activeBgColor: const [
                    AppColors.kPrimaryColor,
                    AppColors.kGreenColor
                  ],
                  initialLabelIndex: context.read<RadioCubit>().currentIndex,
                  activeFgColor: Colors.white,
                  inactiveBgColor: AppColors.kCircleAvatarColor,
                  inactiveFgColor: AppColors.kPrimaryColor,
                  labels: [
                    AppLocalizations.of(context)!.quran,
                    AppLocalizations.of(context)!.radio,
                  ],
                  onToggle: (index) {
                    setState(() {
                      _isRecitersView = index == 0;
                      context.read<RadioCubit>().toggleIndex(index!);
                    });
                  },
                ),
                Spacing.verticalSpace(20),
                const SearchReciterPart(),
                Expanded(
                  child: _isRecitersView
                      ? _buildReciterList(context, state)
                      : _buildRadioView(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildReciterList(BuildContext context, RadioState state) {
    return ConditionalBuilder(
      condition: context.read<RadioCubit>().reciters.isNotEmpty,
      builder: (context) {
        return state is NoSearchResultsState
            ? Center(
                child: Text(
                  AppLocalizations.of(context)!.noReciterFound,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
              )
            : ReciterListView(
                reciters: state is SearchReciterState
                    ? context.read<RadioCubit>().searchResult
                    : context.read<RadioCubit>().reciters,
              );
      },
      fallback: (context) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppConstant.deviceHeight(context) / 3,
          ),
          child: const CustomLoadingIndicator(),
        ),
      ),
    );
  }

  Widget _buildRadioView(BuildContext context) {
    return ConditionalBuilder(
      condition: context.read<RadioCubit>().radois.isNotEmpty,
      builder: (context) {
        return const RadioListView();
      },
      fallback: (context) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppConstant.deviceHeight(context) / 3,
          ),
          child: const CustomLoadingIndicator(),
        ),
      ),
    );
  }
}
