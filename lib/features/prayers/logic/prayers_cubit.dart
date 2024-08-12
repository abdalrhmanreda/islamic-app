import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim_app/features/prayers/logic/prayers_state.dart';

import '../../../generated/assets.dart';
import '../../azkar/data/models/azkar_model.dart';
import '../data/models/prayer_model.dart';

class PrayersCubit extends Cubit<PrayersState> {
  PrayersCubit() : super(const PrayersState.initial());
  List<AzkarModel> prayers(context) => [
        AzkarModel(
          title: AppLocalizations.of(context)!.prayerFood,
          image: Assets.prayersVegetable,
        ),
        AzkarModel(
          title: AppLocalizations.of(context)!.prayerForPrayer,
          image: Assets.prayersPrayer,
        ),
        AzkarModel(
          title: AppLocalizations.of(context)!.prayerForDead,
          image: Assets.prayersDeadBody,
        ),
        AzkarModel(
          title: AppLocalizations.of(context)!.prayerForTraveling,
          image: Assets.prayersPlane,
        ),
        AzkarModel(
            title: AppLocalizations.of(context)!.prayerForMiscellaneous,
            image: Assets.iconsHand),
      ];
  List<List<PrayerModel>> allPrayers = [];
  List<PrayerModel> prayersForPrayer = [];
  List<PrayerModel> prayersForTheDead = [];
  List<PrayerModel> prayersForTravel = [];
  List<PrayerModel> prayersForFood = [];
  List<PrayerModel> variousSupplications = [];
  void getPrayers() {
    emit(const PrayersState.loading());
    rootBundle.loadString(Assets.dataPrayers).then((value) {
      var prayers = jsonDecode(value);
      prayersForPrayer = prayers['أدعية للصلاة']
          .map<PrayerModel>((e) => PrayerModel.fromJson(e))
          .toList();
      prayersForTheDead = prayers['أدعية للميت']
          .map<PrayerModel>((e) => PrayerModel.fromJson(e))
          .toList();
      prayersForTravel = prayers['أدعية للسفر']
          .map<PrayerModel>((e) => PrayerModel.fromJson(e))
          .toList();
      prayersForFood = prayers['أدعية للطعام']
          .map<PrayerModel>((e) => PrayerModel.fromJson(e))
          .toList();
      variousSupplications = prayers['أدعية متنوعة']
          .map<PrayerModel>((e) => PrayerModel.fromJson(e))
          .toList();
      allPrayers = [
        prayersForFood,
        prayersForPrayer,
        prayersForTheDead,
        prayersForTravel,
        variousSupplications
      ];
      emit(PrayersState.loaded(allPrayers));
    }).catchError((error) {
      emit(PrayersState.error(error.toString()));
    });
  }
}
