import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:muslim_app/core/components/progress_indector.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/check_internet/check_internet.dart';
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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    // Listen for player state changes
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
          currentlyPlayingIndex = null;
        });
      } else if (state == PlayerState.playing) {
        setState(() {
          isLoading = false;
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
      setState(() {
        isLoading =
            true; // Start showing loading when new audio is being prepared
      });
      try {
        if (await checkInternet()) {
          await audioPlayer.stop();
          await audioPlayer.play(UrlSource(url));
          setState(() {
            currentlyPlayingIndex = index;
            isPlaying = true;
            isLoading = false; // Stop showing loading once audio starts playing
          });
        } else {
          _showErrorDialog('لا يوجد اتصال بالإنترنت');
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        _showErrorDialog('حدث خطأ أثناء تشغيل الصوت. حاول مرة أخرى.');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('خطأ'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('موافق'),
          ),
        ],
      ),
    );
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
          ),
          child: ListTile(
            title: Text(
              radio.name!.replaceAll('---', ''),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            trailing: isCurrentlyPlaying && isLoading
                ? SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: const CustomLoadingIndicator(),
                  )
                : IconButton(
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
