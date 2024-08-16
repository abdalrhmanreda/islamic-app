import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class PlayPauseButton extends StatefulWidget {
  final int surahIndex;
  final int verseIndex;

  const PlayPauseButton({
    super.key,
    required this.surahIndex,
    required this.verseIndex,
  });

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      // await _audioPlayer.play(
      //   UrlSource(
      //       quran.getAudioURLByVerse(widget.surahIndex, widget.verseIndex)),
      // );
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _togglePlayPause,
      icon: Icon(_isPlaying ? Iconsax.pause_outline : Iconsax.play_outline),
    );
  }
}
