import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../config/colors/app_colors.dart';
import '../../logic/surah_details_cubit.dart';

class PlayPauseSurahButton extends StatefulWidget {
  final int surahIndex;
  final List<int> verseIndices;

  const PlayPauseSurahButton({
    super.key,
    required this.surahIndex,
    required this.verseIndices,
  });

  @override
  _PlayPauseSurahButtonState createState() => _PlayPauseSurahButtonState();
}

class _PlayPauseSurahButtonState extends State<PlayPauseSurahButton> {
  bool _isPlaying = false;
  late AudioPlayer _audioPlayer;
  int _currentVerseIndex = 0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _currentVerseIndex++;
        if (_currentVerseIndex >= widget.verseIndices.length) {
          _isPlaying = false;
        } else {
          context
              .read<SurahDetailsCubit>()
              .changeCurrentVerseIndex(_currentVerseIndex);

          _playVerse(widget.verseIndices[_currentVerseIndex]);
        }
      });
    });
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _playVerse(widget.verseIndices[_currentVerseIndex]);
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  Future<void> _playVerse(int verseIndex) async {
    // await _audioPlayer.play(
    //   UrlSource(
    //     quran.getAudioURLByVerse(widget.surahIndex, verseIndex),
    //   ),
    // );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 50.w,
          height: 20,
          child: LoadingIndicator(
            pause: !_isPlaying,
            indicatorType: Indicator.lineScalePulseOutRapid,
            colors: const [AppColors.kWhiteColor],
          ),
        ),
        IconButton(
          icon: Icon(
            _isPlaying ? Iconsax.pause_outline : Iconsax.play_outline,
            color: AppColors.kWhiteColor,
          ),
          onPressed: _togglePlayPause,
        ),
      ],
    );
  }
}
