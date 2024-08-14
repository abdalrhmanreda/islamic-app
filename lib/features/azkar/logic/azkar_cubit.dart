import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../../../generated/assets.dart';
import '../data/models/azkar_model.dart';
import '../data/models/zaker_mode.dart';
import 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(const AzkarState.initial());

  List<int> azkarTasbeeh = [];
  PageController pageController = PageController();
  final GlobalKey _globalKey = GlobalKey();

  List<AzkarModel> azkar(BuildContext context) => [
        AzkarModel(
          title: AppLocalizations.of(context)!.azkarMoringButton,
          image: Assets.azkarMoringAzker,
        ),
        AzkarModel(
          title: AppLocalizations.of(context)!.azkarNightButton,
          image: Assets.azkarNightAzker,
        ),
        AzkarModel(
          title: AppLocalizations.of(context)!.azkarSleepingButton,
          image: Assets.azkarSleeping,
        ),
        AzkarModel(
          title: AppLocalizations.of(context)!.azkarAfterPreyButton,
          image: Assets.azkarPray,
        ),
        AzkarModel(
          title: AppLocalizations.of(context)!.azkarWakeUpButton,
          image: Assets.azkarWakeUp,
        ),
      ];

  List<ZakerModel> moringAzkar = [];
  List<ZakerModel> nightAzkar = [];
  List<ZakerModel> sleepingAzkar = [];
  List<ZakerModel> afterPrayerAzkar = [];
  List<ZakerModel> wakeUpAzkar = [];

  List<List<ZakerModel>> allAzkar = [];

  void getAzkar() {
    emit(const AzkarState.loading());
    rootBundle.loadString(Assets.dataAzkar).then((value) {
      var data = jsonDecode(value);
      moringAzkar = (data['أذكار الصباح'] as List)
          .map<ZakerModel>((e) => ZakerModel.fromJson(e))
          .toList();
      nightAzkar = (data['أذكار المساء'] as List)
          .map<ZakerModel>((e) => ZakerModel.fromJson(e))
          .toList();
      sleepingAzkar = (data['أذكار النوم'] as List)
          .map<ZakerModel>((e) => ZakerModel.fromJson(e))
          .toList();
      afterPrayerAzkar = (data['أذكار بعد السلام من الصلاة المفروضة'] as List)
          .map<ZakerModel>((e) => ZakerModel.fromJson(e))
          .toList();
      wakeUpAzkar = (data['أذكار الاستيقاظ'] as List)
          .map<ZakerModel>((e) => ZakerModel.fromJson(e))
          .toList();

      allAzkar = [
        moringAzkar,
        nightAzkar,
        sleepingAzkar,
        afterPrayerAzkar,
        wakeUpAzkar
      ];
      emit(AzkarState.loaded(data));
    }).catchError((e) {
      emit(AzkarState.error(e.toString()));
    });
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((value) {
      emit(const AzkarState.copyToClipboard());
    }).catchError((e) {
      emit(AzkarState.error(e.toString()));
    });
  }

  void shareZaker(String text) async {
    await Share.share(text);
  }
}
