import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/helpers/local_data_base.dart';
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

  LocalDatabase localDatabase = LocalDatabase();
  void addToFavorite(String category, int index) {
    if (!isFavorite(index)) {
      emit(const AzkarState.loading());
      localDatabase.insert({
        'zakerIndex': index,
        'category': category,
      }, 'azkar').then((value) {
        getFavorite();
        emit(AzkarState.addToFavorite(category));
      }).catchError((e) {
        emit(AzkarState.error(e.toString()));
      });
    } else {
      removeFromFavorite(index);
    }
  }

  void removeFromFavorite(int index) {
    emit(const AzkarState.loading());
    localDatabase
        .delete('azkar', column: 'zakerIndex', value: index)
        .then((value) {
      getFavorite();
      emit(AzkarState.removeFromFavorite(index));
    }).catchError((e) {
      emit(AzkarState.error(e.toString()));
    });
  }

  List<int> favoriteAzkarIndex = [];
  void getFavorite() {
    emit(const AzkarState.loading());
    localDatabase.queryAllFromTable('azkar').then((value) {
      favoriteAzkarIndex = value.map((e) => e['zakerIndex'] as int).toList();
      emit(AzkarState.getFavorite(favoriteAzkarIndex));
    }).catchError((e) {
      emit(AzkarState.error(e.toString()));
    });
  }

  bool isFavorite(int index) {
    return favoriteAzkarIndex.contains(index);
  }
}
