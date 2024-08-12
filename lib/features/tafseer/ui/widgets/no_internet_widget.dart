import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/assets.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.noInternetNoInternet,
              width: 200.w,
              height: 200.h,
            ),
            Text(
              AppLocalizations.of(context)!.noInternetConnection,
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
