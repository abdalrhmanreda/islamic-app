import 'package:flutter/material.dart';
import 'package:muslim_app/core/components/custom_sliver_app_bar.dart';
import 'package:muslim_app/core/helpers/extensions.dart';
import 'package:muslim_app/features/home/data/model/feature_model.dart';
import 'package:muslim_app/features/home/ui/widgets/feature_item.dart';
import 'package:muslim_app/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../ahadith/ui/widgets/ahadith_item.dart';

class ZakatScreen extends StatelessWidget {
  const ZakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FeatureModel> zakat = [
      FeatureModel(
        title: AppLocalizations.of(context)!.moneyZakat,
        image: Assets.iconsZakat,
        widget: RoutePath.zakatMoneyDetailsScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.goldZakat,
        image: Assets.iconsGoldIngots,
        widget: RoutePath.sliverGoldZakatScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.silverZakat,
        image: Assets.iconsSilver,
        widget: RoutePath.sliverGoldZakatScreen,
      ),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: AppLocalizations.of(context)!.zakat,
            image: Assets.iconsZakat,
            description: AppLocalizations.of(context)!.zakatk,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return AhadithItem(
                  title: zakat[index].title,
                  image: zakat[index].image,
                  widget: zakat[index].widget,
                  onTap: () {
                    context.navigateToWidgetByNamed(
                      context,
                      zakat[index].widget,
                      arguments: zakat[index],
                    );
                  },
                );
              },
              childCount: zakat.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
