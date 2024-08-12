import 'dart:convert';
import 'dart:math';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../../../core/helpers/notifcation_services.dart';
import '../../../core/methods/get_current_location/get_current_location.dart';
import '../../../generated/assets.dart';
import '../../prayer_timings/data/models/prayer_timing_model.dart';
import '../data/model/surha.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  Position? position;
  String address = '';

  void getLocation(context) async {
    emit(const HomeState.loading());
    GetCurrentLocation().getCurrentPosition().then((value) {
      position = value;
      print(position);
      GetCurrentLocation()
          .getAddressFromCoordinates(
              position!.latitude, position!.longitude, 'ar')
          .then((value) {
        address = value;
        getPrayerTimes();
        sendNotification();
      });
      loadJsonAsset();
      emit(HomeState.loaded(position));
    }).catchError((e) {
      emit(HomeState.error(e.toString()));
    });
  }

  PrayerTimes getPrayerTimes() {
    Coordinates coordinates =
        Coordinates(position!.latitude, position!.longitude);
    var date = DateTime.now();
    var params = CalculationMethod.egyptian();
    var prayerTimes = PrayerTimes(
      coordinates: coordinates,
      date: date,
      calculationParameters: params,
    );
    return prayerTimes;
  }

  DateTime? nextPrayerTime;

  DateTime getNextPrayerTime() {
    PrayerTimes prayerTimes = getPrayerTimes();
    var next = prayerTimes.nextPrayer();
    var nextPrayerTime = prayerTimes.timeForPrayer(next)!.toLocal();
    emit(HomeState.findNextPrayer(
        {"nextPrayerTime": nextPrayerTime, "nextPrayer": next}));
    return nextPrayerTime;
  }

  List<PrayerTimingModel> prayers(context) => [
        PrayerTimingModel(
          img: Assets.prayerTimingsFajr,
          prayerName: AppLocalizations.of(context)!.fajr,
          prayerTime:
              DateFormat('hh:mm a').format(getPrayerTimes().fajr!.toLocal()),
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsSunset,
          prayerName: AppLocalizations.of(context)!.shuruq,
          prayerTime:
              DateFormat('hh:mm a').format(getPrayerTimes().sunrise!.toLocal()),
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsDhuhr,
          prayerName: AppLocalizations.of(context)!.dhuhr,
          prayerTime:
              DateFormat('hh:mm a').format(getPrayerTimes().dhuhr!.toLocal()),
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsAsr,
          prayerName: AppLocalizations.of(context)!.asr,
          prayerTime:
              DateFormat('hh:mm a').format(getPrayerTimes().asr!.toLocal()),
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsSunset,
          prayerName: AppLocalizations.of(context)!.maghrib,
          prayerTime:
              DateFormat('hh:mm a').format(getPrayerTimes().maghrib!.toLocal()),
        ),
        PrayerTimingModel(
          img: Assets.prayerTimingsAsha,
          prayerName: AppLocalizations.of(context)!.isha,
          prayerTime:
              DateFormat('hh:mm a').format(getPrayerTimes().isha!.toLocal()),
        ),
      ];

  final azkar = [
    "سُبْحَانَ اللَّهِ",
    "صلي علي النبي",
    "الْحَمْدُ لِلَّهِ",
    "اللهُ أَكْبَرُ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ.",
    "سُبْحَانَ اللَّهِ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "أستغفر الله",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَرُ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "لَا إِلَهَ إِلَّا اللَّهُ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
    "الْلَّهُ أَكْبَرُ",
    "اللهم صلي وسلم وبارك علي سيدنا محمد",
  ];
  void sendNotification() {
    final Random random = Random();
    final int randomIndex = random.nextInt(azkar.length);
    final String randomAzkar = azkar[randomIndex];

    NotificationService.scheduleNotificationEvery15Minutes(
      randomAzkar,
    );
    emit(const HomeState.sendNotification());
  }

  List<Surah> surahs = [];
  Future<void> loadJsonAsset() async {
    try {
      final String jsonString = await rootBundle.loadString(Assets.dataSurahs);
      var data = jsonDecode(jsonString) as List;

      surahs = data.map((json) => Surah.fromJson(json)).toList();
      emit(const HomeState.loadData());
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
    // Initialize filteredData with all surahs
  }
}
