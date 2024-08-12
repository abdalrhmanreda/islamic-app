import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/ahadith/logic/ahadith_cubit.dart';
import '../../features/azkar/logic/azkar_cubit.dart';
import '../../features/location/logic/location_cubit.dart';
import '../../features/prayers/logic/prayers_cubit.dart';
import '../../features/radio_screen/logic/radio_cubit.dart';
import '../../features/tafseer/data/repo/tafseer_repo.dart';
import '../../features/tafseer/logic/tafseer_cubit.dart';
import '../../features/tasbeeh/logic/tasbeeh_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio dio = await DioFactory.initDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //
  // getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<LocationCubit>(() => LocationCubit());
  getIt.registerFactory<RadioCubit>(() => RadioCubit());
  getIt.registerFactory<TasbeehCubit>(() => TasbeehCubit());
  getIt.registerFactory<AhadithCubit>(() => AhadithCubit());
  getIt.registerFactory<AzkarCubit>(() => AzkarCubit());
  getIt.registerFactory<PrayersCubit>(() => PrayersCubit());
  // getIt.registerFactory<NamesOfAlluhCubit>(() => NamesOfAlluhCubit());
  //
  // // tafseer
  getIt.registerLazySingleton<TafseerRepo>(() => TafseerRepo(getIt()));
  //
  getIt.registerFactory<TafseerCubit>(() => TafseerCubit(getIt()));
}
