import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'config/routes/router.dart';
import 'config/routes/routes_path.dart';
import 'core/cache/hive_cache.dart';
import 'core/di/dependancy_injection.dart';
import 'core/observer/bloc_observer.dart';
import 'muslim_app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // await NotificationService.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  tz.initializeTimeZones();
  await setupGetIt();
  await Hive.initFlutter();
  await HiveCache.openHive();
  bool onboarding = HiveCache.getData(key: 'onboarding') ?? false;
  Bloc.observer = MyBlocObserver();
  String initRoute = onboarding ? RoutePath.layout : RoutePath.onBoarding;
  runApp(
    MuslimApp(
      appRouter: AppRouter(),
      initRoute: initRoute,
    ),
  );
}
