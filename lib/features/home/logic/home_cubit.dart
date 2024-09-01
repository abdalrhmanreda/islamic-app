import 'dart:convert';
import 'dart:math';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/helpers/local_notify.dart';
import '../../../core/methods/get_current_location/get_current_location.dart';
import '../../../generated/assets.dart';
import '../../list_of_surahs/data/models/surha.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  Position? position;
  String address = '';
  DateTime currentDate = DateTime.now();
  PrayerTimes? mainPrayerTimes;

  void getLocation(context) async {
    emit(const HomeState.loading());
    GetCurrentLocation().getCurrentPosition().then((value) {
      position = value;
      GetCurrentLocation()
          .getAddressFromCoordinates(
              position!.latitude, position!.longitude, 'ar')
          .then((value) {
        address = value;
        getPrayerTimes();
      });
      loadJsonAsset();
      sendNotification();
      emit(HomeState.loaded(position));
    }).catchError((e) {
      emit(HomeState.error(e.toString()));
    });
  }

  PrayerTimes getPrayerTimes({DateTime? date}) {
    Coordinates coordinates =
        Coordinates(position!.latitude, position!.longitude);
    var dateNow = DateTime.now();
    var params = CalculationMethod.egyptian();
    var prayerTimes = PrayerTimes(
      coordinates: coordinates,
      date: date ?? dateNow,
      calculationParameters: params,
    );
    mainPrayerTimes = prayerTimes;
    print(mainPrayerTimes?.fajr);

    return prayerTimes;
  }

  void getPrayerTimesForSelectedDay({DateTime? date}) async {
    emit(const HomeState.loading());
    try {
      Position position = await GetCurrentLocation().getCurrentPosition();
      Coordinates coordinates =
          Coordinates(position.latitude, position.longitude);
      var dateNow = DateTime.now();
      var params = CalculationMethod.egyptian();
      mainPrayerTimes = PrayerTimes(
        coordinates: coordinates,
        date: date ?? dateNow,
        calculationParameters: params,
      );
      emit(HomeState.prayerTimeSelected(mainPrayerTimes!.fajr!.toLocal()));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
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

  int get currentDay => currentDate.day;

  int get currentYear => currentDate.year; // Add this getter

  int get currentMonth => currentDate.month; // Add this getter

  void selectDay(int day) {
    currentDate = DateTime(currentDate.year, currentDate.month, day);
    emit(HomeState.daySelected(currentDate));
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

    NotificationService().scheduleRepeatingNotification(
      body: randomAzkar,
    );
    emit(const HomeState.sendNotification());
  }
}
