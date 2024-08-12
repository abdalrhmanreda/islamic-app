import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/radio_cubit.dart';

class RadioListView extends StatefulWidget {
  const RadioListView({super.key});

  @override
  _RadioListViewState createState() => _RadioListViewState();
}

class _RadioListViewState extends State<RadioListView> {
  final AudioPlayer audioPlayer = AudioPlayer();
  int? currentlyPlayingIndex;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
          currentlyPlayingIndex = null;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio(int index, String url) async {
    if (currentlyPlayingIndex == index && isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      await audioPlayer.stop();
      await audioPlayer.play(UrlSource(url));
      setState(() {
        currentlyPlayingIndex = index;
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final radio = context.read<RadioCubit>().radois[index];
        final isCurrentlyPlaying = index == currentlyPlayingIndex && isPlaying;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            // color: AppColors.kPrimaryColor.withOpacity(0.1),
          ),
          child: ListTile(
            title: Text(
              radio.name!.replaceAll('---', ''),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            trailing: IconButton(
              icon: Icon(
                isCurrentlyPlaying
                    ? Iconsax.pause_outline
                    : Iconsax.play_outline,
                color: AppColors.kPrimaryColor,
              ),
              onPressed: () {
                _playPauseAudio(index, radio.url!);
              },
            ),
            onTap: () {
              _playPauseAudio(index, radio.url!);
            },
          ),
        );
      },
      separatorBuilder: (context, index) => Spacing.verticalSpace(10),
      itemCount: context.read<RadioCubit>().radois.length,
    );
  }
}
