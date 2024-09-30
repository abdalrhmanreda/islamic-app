import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:muslim_app/core/helpers/spacing.dart';
import 'package:muslim_app/features/home/ui/widgets/prayer_container.dart';

import '../../../../core/components/progress_indector.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'feature_item.dart';
import 'features.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    // Check and request location permission
    context.read<HomeCubit>().position == null ? _checkPermission() : null;
  }

  Future<void> _checkPermission() async {
    var status = await Permission.location.status;

    if (status.isDenied) {
      // Request the permission
      if (await Permission.location.request().isDenied) {
        // If denied, show an alert dialog explaining why it's needed
        _showPermissionDeniedAlert();
      } else {
        // Permission granted, proceed to get location
        context.read<HomeCubit>().getLocation(context);
      }
    } else if (status.isGranted) {
      // If permission is already granted, get location
      context.read<HomeCubit>().getLocation(context);
    }
  }

  void _showPermissionDeniedAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("مهم: إذن الموقع"),
          content: const Text(
              "التطبيق يحتاج الوصول إلى موقعك لتوفير مواقيت الصلاة بدون اتصال بالإنترنت. يُرجى تفعيل إذن الموقع."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Geolocator.openLocationSettings();
              },
              child: const Text("حسنًا"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // Handle state changes
        if (state is Error) {
          if (state.message == 'Permission Denied' ||
              state.message ==
                  'The location service on the device is disabled.') {
            _showPermissionDeniedAlert();
          }
        }
      },
      builder: (context, state) {
        return context.read<HomeCubit>().position != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const PrayerContainer(),
                    Spacing.verticalSpace(10),

                    // Constrain the height of the GridView to prevent overflow
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: featuredItems(context).length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        childAspectRatio: .88,
                      ),
                      itemBuilder: (context, index) {
                        final feature = featuredItems(context)[index];

                        return index == 0
                            ? FeatureItem(
                                image: feature.image,
                                title: feature.title,
                                widget: feature.widget,
                                args: context.read<HomeCubit>().surahs,
                              )
                            : FeatureItem(
                                image: feature.image,
                                title: feature.title,
                                widget: feature.widget,
                              );
                      },
                    ),
                  ],
                ),
              )
            : const CustomLoadingIndicator();
      },
    );
  }
}
