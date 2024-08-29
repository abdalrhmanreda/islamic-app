import 'package:adhan_dart/adhan_dart.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../../generated/assets.dart';
import '../data/models/prayer_timing_model.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit() : super(PrayerInitial());

  DateTime currentDate = DateTime.now();
  int get currentDay => currentDate.day;

  int get currentYear => currentDate.year; // Add this getter

  int get currentMonth => currentDate.month; // Add this getter

  void selectDay(int day) {
    currentDate = DateTime(currentDate.year, currentDate.month, day);
    emit(DaySeleceted(currentDate));
  }

  PrayerTimes ?prayerTimes;
  void getPrayerTimes({ DateTime? date}) async{
    emit(PrayerLoading());
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final calculationMethod = CalculationMethod.egyptian();
      final coordinates = Coordinates(position.latitude, position.longitude);
      prayerTimes = PrayerTimes(coordinates: coordinates, date: date ?? DateTime.now(), calculationParameters: calculationMethod, );
      emit(PrayerLoaded(prayerTimes!));
    } catch (e) {
      emit(PrayerError(e.toString()));
    }
  }
  DateTime? nextPrayerTime;

  List<PrayerTimingModel> prayers(
      context,
      ) =>
      [
        PrayerTimingModel(
          img: Assets.prayerTimingsFajr,
          prayerName: AppLocalizations.of(context)!.fajr,
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsSunset,
          prayerName: AppLocalizations.of(context)!.shuruq,
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsDhuhr,
          prayerName: AppLocalizations.of(context)!.dhuhr,
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsAsr,
          prayerName: AppLocalizations.of(context)!.asr,
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsSunset,
          prayerName: AppLocalizations.of(context)!.maghrib,
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsAsha,
          prayerName: AppLocalizations.of(context)!.isha,
        ),
      ];
}
