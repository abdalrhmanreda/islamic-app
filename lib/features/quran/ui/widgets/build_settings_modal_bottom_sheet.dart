import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/app_variable.dart';

Future<dynamic> buildSettingsModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) => SizedBox(
      height: AppConstant.deviceHeight(context) / 2.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.chooseReciter,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
                DropdownButton(
                    hint: Text(AppVariable.currentReciter),
                    onChanged: (value) {
                      AppVariable.currentReciter = value.toString();
                      Navigator.pop(context);
                    },
                    items: AppVariable.recitersUrls.keys
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 18.sp,
                                    ),
                              ),
                            ))
                        .toList()),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
