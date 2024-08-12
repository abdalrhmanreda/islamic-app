import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/prayer_model.dart';
import '../widgets/prayer_item_details.dart';

class PrayerScreenDetails extends StatelessWidget {
  const PrayerScreenDetails({super.key, required this.prayers});
  final PrayerModel prayers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prayers.title!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeightHelper.regular,
                  fontSize: 18.sp,
                )),
      ),
      body: ListView.separated(
          itemCount: prayers.text!.length,
          itemBuilder: (context, index) {
            final prayer = prayers.text![index];
            return PrayerItemDetails(prayer: prayer);
          },
          separatorBuilder: (context, index) => Spacing.verticalSpace(20)),
    );
  }
}
