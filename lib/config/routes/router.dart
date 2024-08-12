import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/config/routes/routes_path.dart';
import 'package:muslim_app/core/di/dependancy_injection.dart';
import 'package:muslim_app/features/location/ui/screens/enable_location.dart';

import '../../features/layout/ui/layout_screen.dart';
import '../../features/location/logic/location_cubit.dart';
import '../../features/on_boarding/ui/screens/on_boarding_screen.dart';

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
      case RoutePath.radioScreen:
    }
  }
}
