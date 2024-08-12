import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/features/on_boarding/ui/screens/on_boarding_screen.dart';

import 'config/routes/router.dart';
import 'config/themes/themes.dart';

class MuslimApp extends StatelessWidget {
  final AppRouter appRouter;
  const MuslimApp({
    super.key,
    required this.initRoute,
    required this.appRouter,
  });
  final String initRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: MaterialApp(
            locale: const Locale('ar', 'EG'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            theme: Style.lightTheme,
            darkTheme: Style.darkTheme,
            themeMode: ThemeMode.light,
            initialRoute: initRoute,
          ),
        ),
      ),
    );
  }
}
