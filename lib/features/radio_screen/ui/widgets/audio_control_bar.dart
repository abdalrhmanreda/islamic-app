import 'package:flutter/material.dart';

class AudioControlBar extends StatelessWidget {
  final Duration currentDuration;
  final Duration totalDuration;
  final VoidCallback onPlayPause;
  final VoidCallback onStop;
  final bool isPlaying;
  final ValueChanged<double> onSeek;

  const AudioControlBar({
    super.key,
    required this.currentDuration,
    required this.totalDuration,
    required this.onPlayPause,
    required this.onStop,
    required this.isPlaying,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: currentDuration.inSeconds.toDouble(),
          max: totalDuration.inSeconds.toDouble(),
          onChanged: (value) {
            onSeek(value);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: onPlayPause,
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: onStop,
            ),
            Text(
              '${currentDuration.inMinutes}:${(currentDuration.inSeconds % 60).toString().padLeft(2, '0')} / ${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
            ),
          ],
        ),
      ],
    );
  }
}
