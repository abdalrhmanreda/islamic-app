import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:device_preview/device_preview.dart';

import 'config/routes/router.dart';
import 'config/routes/routes_path.dart';
import 'core/cache/hive_cache.dart';
import 'core/di/dependancy_injection.dart';
import 'core/helpers/local_notify.dart';
import 'core/observer/bloc_observer.dart';
import 'muslim_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().requestPermissions();

  tz.initializeTimeZones();
  await setupGetIt();
  await Hive.initFlutter();
  await HiveCache.openHive();
  bool onboarding = HiveCache.getData(key: 'onboarding') ?? false;
  Bloc.observer = MyBlocObserver();
  String initRoute = onboarding ? RoutePath.layout : RoutePath.onBoarding;
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://555b2abcdd06c2533fca15ed804eb8fb@o4507987241533440.ingest.us.sentry.io/4507997031759872';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = .01;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
    },
    appRunner: () => runApp(
      MuslimApp(
        appRouter: AppRouter(),
        initRoute: initRoute,
      ),
    ),
  );
}
