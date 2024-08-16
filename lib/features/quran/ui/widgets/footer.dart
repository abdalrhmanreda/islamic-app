import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  final int index;
  final String surahName;
  final int surahNumber;

  const Footer({
    Key? key,
    required this.index,
    required this.surahName,
    required this.surahNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Text(
            "$index",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

String getAudioURLBySurah(int surahNumber, String reciter) {
  // Dummy URL for demonstration. Replace with actual logic to get the audio URL
  // You might need to format the URL based on the surahNumber and reciter
  return 'https://www.example.com/audio/${surahNumber}_$reciter.mp3';
}
