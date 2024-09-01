import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/zaker_mode.dart';
import '../widgets/azkar_item.dart';

class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen({super.key, required this.azkar});

  final List<ZakerModel> azkar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          azkar.first.category!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: azkar.length,
        separatorBuilder: (context, index) => Spacing.verticalSpace(20.h),
        itemBuilder: (context, index) {
          return AzkarItem(
            zakerModel: azkar[index],
            index: index,
          );
        },
      ),
    );
  }
}
