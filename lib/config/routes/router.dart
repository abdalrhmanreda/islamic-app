import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/config/routes/routes_path.dart';
import 'package:muslim_app/core/di/dependancy_injection.dart';
import 'package:muslim_app/features/azkar/data/models/zaker_mode.dart';
import 'package:muslim_app/features/azkar/logic/azkar_cubit.dart';
import 'package:muslim_app/features/azkar/ui/screens/azkar_details_screen.dart';
import 'package:muslim_app/features/azkar/ui/screens/azkar_screen.dart';
import 'package:muslim_app/features/location/ui/screens/enable_location.dart';
import 'package:muslim_app/features/tafseer/ui/screens/tafseer_screen.dart';

import '../../features/ahadith/logic/ahadith_cubit.dart';
import '../../features/ahadith/ui/screens/ahadith_screen.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/layout/ui/layout_screen.dart';
import '../../features/list_of_surahs/data/models/surha.dart';
import '../../features/list_of_surahs/ui/screens/surahs_list.dart';
import '../../features/location/logic/location_cubit.dart';
import '../../features/names_of_alluh/logic/names_of_alluh_cubit.dart';
import '../../features/names_of_alluh/ui/screens/names_of_alluh.dart';
import '../../features/on_boarding/ui/screens/on_boarding_screen.dart';
import '../../features/prayer_timings/ui/screens/prayer_timings_screen.dart';
import '../../features/prayers/data/models/prayer_model.dart';
import '../../features/prayers/logic/prayers_cubit.dart';
import '../../features/prayers/ui/screens/prayer_list_screen.dart';
import '../../features/prayers/ui/screens/prayer_screen_details.dart';
import '../../features/prayers/ui/screens/prayers_screen.dart';
import '../../features/qibla/ui/screens/qibla_screen.dart';
import '../../features/tasbeeh/logic/tasbeeh_cubit.dart';
import '../../features/tasbeeh/ui/screens/tasbeeh_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this argument is used to pass data from one screen to another
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutePath.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RoutePath.layout:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case RoutePath.enableLocation:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<LocationCubit>(),
                child: const EnableLocation()));
      case RoutePath.tasbeehScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<TasbeehCubit>()..getTasbeeh(),
                child: const TasbeehScreen()));
      case RoutePath.azkarScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<AzkarCubit>()..getAzkar(),
                child: const AzkarScreen()));
      case RoutePath.azkarDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AzkarCubit>(),
                  child: AzkarDetailsScreen(
                    azkar: arguments as List<ZakerModel>,
                  ),
                ));
      case RoutePath.tafsirScreen:
        return MaterialPageRoute(builder: (_) => const TafseerScreen());
      case RoutePath.qiblaScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<LocationCubit>(),
              child: const QiblahScreen()),
        );

      case RoutePath.prayersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<PrayersCubit>()..getPrayers(),
              child: const PrayersScreen()),
        );
      case RoutePath.prayersListScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<PrayersCubit>(),
              child: PrayerListScreen(prayers: arguments as List<PrayerModel>)),
        );
      case RoutePath.prayerScreenDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PrayersCubit>(),
            child: PrayerScreenDetails(
              prayers: arguments as PrayerModel,
            ),
          ),
        );
      case RoutePath.namesOfAlluh:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) =>
                  getIt<NamesOfAlluhCubit>()..getNamesOfAlluh(),
              child: const NamesOfAlluh()),
        );
      case RoutePath.ahadithScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<AhadithCubit>(),
              child: const AhadithScreen()),
        );
      case RoutePath.prayerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<HomeCubit>()
                ..getPrayerTimesForSelectedDay()
                ..getLocation(context),
              child: const PrayerTimingsScreen()),
        );
      case RoutePath.quran:
        return MaterialPageRoute(
          builder: (_) => SurahsList(
            surahs: arguments as List<Surah>,
          ),
        );
    }
    return null;
  }
}
