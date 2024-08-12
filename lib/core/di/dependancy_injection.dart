import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio dio = await DioFactory.initDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //
  // getIt.registerFactory<HomeCubit>(() => HomeCubit());
  // getIt.registerFactory<LocationCubit>(() => LocationCubit());
  // getIt.registerFactory<TasbeehCubit>(() => TasbeehCubit());
  // getIt.registerFactory<AhadithCubit>(() => AhadithCubit());
  // getIt.registerFactory<AzkarCubit>(() => AzkarCubit());
  // getIt.registerFactory<PrayersCubit>(() => PrayersCubit());
  // getIt.registerFactory<NamesOfAlluhCubit>(() => NamesOfAlluhCubit());
  //
  // // tafseer
  // getIt.registerLazySingleton<TafseerRepo>(() => TafseerRepo(getIt()));
  //
  // getIt.registerFactory<TafseerCubit>(() => TafseerCubit(getIt()));
}
