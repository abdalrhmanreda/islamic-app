import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/app_variable.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';

class ItemInTheSurahList extends StatefulWidget {
  const ItemInTheSurahList({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final VoidCallback onTap;

  @override
  _ItemInTheSurahListState createState() => _ItemInTheSurahListState();
}

class _ItemInTheSurahListState extends State<ItemInTheSurahList> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration? _duration;
  Duration? _position;
  bool _isDragging = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        isPlaying = state == PlayerState.playing;
      });

      if (state == PlayerState.playing) {
        AudioManager().setCurrentPlayer(_audioPlayer);
      } else if (state == PlayerState.stopped ||
          state == PlayerState.completed) {
        AudioManager().clearCurrentPlayer();
      }
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      if (!mounted) return;
      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      if (!mounted) return;
      if (!_isDragging) {
        setState(() {
          _position = position;
        });
      }
    });

    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;
      if (!_isDragging && isPlaying) {
        setState(() {
          _position = _position! + const Duration(milliseconds: 500);
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _handlePlayPause() async {
    final audioUrl =
        '${AppVariable.recitersUrls[AppVariable.currentReciter]}${(widget.index + 1).toString().padLeft(3, '0')}.mp3';
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        AudioManager().setCurrentPlayer(_audioPlayer);
        await _audioPlayer.play(UrlSource(audioUrl));
      }
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void _seekToSecond(int second) {
    if (_duration != null) {
      Duration newPosition = Duration(seconds: second);
      _audioPlayer.seek(newPosition);
      setState(() {
        _position = newPosition;
      });
    }
  }

  String _formatDuration(Duration duration) {
    return duration.toString().split('.').first.padLeft(8, "0");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(15),
            width: AppConstant.deviceWidth(context),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.iconsEndOfVerse,
                      width: 30.h,
                      height: 30.h,
                      colorFilter: const ColorFilter.mode(
                          AppColors.kPrimaryColor, BlendMode.srcIn),
                    ),
                    Text(
                      '${widget.index + 1}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeightHelper.medium,
                          ),
                    ),
                  ],
                ),
                Spacing.horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppVariable.quranSurahs[widget.index]['arabic']!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeightHelper.medium,
                          ),
                    ),
                    Text(
                      '${AppVariable.quranSurahs[widget.index]['ayahs']!} ${AppLocalizations.of(context)!.theNumberOfItsVerses}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.index + 1} .${AppVariable.quranSurahs[widget.index]['english']!}',
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeightHelper.medium,
                          ),
                    ),
                  ],
                ),
                Spacing.horizontalSpace(10),
                IconButton(
                  icon: Icon(
                    isPlaying ? Iconsax.pause_outline : Iconsax.play_outline,
                    color: AppColors.kPrimaryColor,
                  ),
                  onPressed: _handlePlayPause,
                ),
              ],
            ),
          ),
          if (isPlaying && _duration != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              child: LinearProgressIndicator(
                value: _position != null &&
                        _duration != null &&
                        _duration!.inMilliseconds != 0
                    ? _position!.inMilliseconds / _duration!.inMilliseconds
                    : 0.0,
                backgroundColor: AppColors.kWhiteColor,
                valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.kPrimaryColor),
              ),
            ),
        ],
      ),
    );
  }
}

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  AudioPlayer? _currentPlayer;

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal();

  void setCurrentPlayer(AudioPlayer player) {
    if (_currentPlayer != null && _currentPlayer != player) {
      _currentPlayer!.stop();
    }
    _currentPlayer = player;
  }

  void clearCurrentPlayer() {
    _currentPlayer = null;
  }
}
