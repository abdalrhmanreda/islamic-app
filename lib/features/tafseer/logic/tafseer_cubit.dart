import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../data/models/aya_tafseer_model.dart';
import '../data/repo/tafseer_repo.dart';

part 'tafseer_state.dart';

class TafseerCubit extends Cubit<TafseerState> {
  final TafseerRepo _tafseerRepo;

  TafseerCubit(this._tafseerRepo) : super(TafseerInitial());

  void getTafseer(int index) async {
    emit(TafseerLoading());
    final result = await _tafseerRepo.getTafseer(index);
    result.when(
      success: (data) {
        emit(TafseerLoaded(data));
      },
      error: (message) {
        print('Error---------------: $message');
        emit(TafseerError(message));
      },
    );
  }

  final GlobalKey _globalKey = GlobalKey();

  Future<void> captureAndSharePng(String tafseer, String surahName) async {
    try {
      // التأكد من أن الـ RenderObject متاح
      final RenderRepaintBoundary? boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        emit(TafseerError("Boundary is null"));
        return;
      }

      // التقاط الصورة وتحويلها إلى بيانات ثنائية
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        emit(TafseerError("Failed to convert image to byte data"));
        return;
      }
      final Uint8List pngBytes = byteData.buffer.asUint8List();

      // الحصول على المسار المؤقت لحفظ الصورة
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/$surahName.png';

      // كتابة البيانات إلى ملف
      final File imgFile = File(imagePath);
      await imgFile.writeAsBytes(pngBytes);

      // مشاركة الصورة باستخدام Share
      final XFile xFile = XFile(imagePath);
      await Share.shareXFiles([xFile], text: tafseer);
    } catch (e) {
      emit(TafseerError(e.toString()));
    }
  }

  GlobalKey get globalKey => _globalKey;
}
