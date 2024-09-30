import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../../on_boarding/data/model/on_boarding_item_content.dart';
import '../../../on_boarding/ui/widgets/on_boarding_item.dart';
import '../../logic/location_cubit.dart';
import '../../logic/location_state.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingItemContent onBoardingItemContent = OnBoardingItemContent(
      description: AppLocalizations.of(context)!.enableLocationTitle,
      image: Assets.locationLocation,
    );
    return Scaffold(
      body: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is Success) {
            context.navigateAndFinishNyNamed(context, RoutePath.layout);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return SizedBox(
            width: AppConstant.deviceWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OnBoardingItem(
                    onBoardingItemContent: onBoardingItemContent,
                    context: context),
                Spacing.verticalSpace(25),
                CustomButton(
                  onPressed: () {
                    context.read<LocationCubit>().getLocation();
                  },
                  text: AppLocalizations.of(context)!.enableLocationButtonText,
                  width: AppConstant.deviceWidth(context) / 2,
                  radius: 10.r,
                ),
                Spacing.verticalSpace(15),
                GestureDetector(
                  onTap: () {
                    context.navigateAndFinishNyNamed(context, RoutePath.layout);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.skip,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
