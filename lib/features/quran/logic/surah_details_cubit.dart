import 'dart:io';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/features/quran/logic/surah_details_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:share_plus/share_plus.dart';

import '../../../config/colors/app_colors.dart';
import '../../../config/themes/font_weight.dart';

class SurahDetailsCubit extends Cubit<SurahDetailsState> {
  SurahDetailsCubit() : super(Initial());

  final GlobalKey _globalKey = GlobalKey();
  GlobalKey get globalKey => _globalKey;

  int selectedAyaIndex = 0;
  bool isPlaying = false;
  int currentVerseIndex = 0;
  int currentIndex = 0;

  void shareSurah(String surahName, String surahText) {
    Share.share('$surahName\n$surahText').then((value) {
      emit(Loaded(value.raw));
    }).catchError((error) {
      emit(Error(error.toString()));
    });
  }

  void copyToClipboard(BuildContext context, int surahIndex, int verseIndex) {
    String verse = quran.getVerse(surahIndex, verseIndex);
    Clipboard.setData(ClipboardData(text: verse));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context)!.verseCopiedToClipboard,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
                color: AppColors.kWhiteColor,
                fontWeight: FontWeightHelper.regular,
              ),
        ),
      ),
    );
  }

  Future<void> captureAndSharePng(String surahName) async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/image.png';

      // Write bytes to file
      File imgFile = File(imagePath);
      await imgFile.writeAsBytes(pngBytes);

      // Share the file using shareXFiles
      XFile xFile = XFile(imagePath);
      await Share.shareXFiles([xFile], text: surahName);
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void changeCurrentVerseIndex(int index) {
    currentVerseIndex = index;
    emit(ChangeCurrentIndex(index));
  }
}
