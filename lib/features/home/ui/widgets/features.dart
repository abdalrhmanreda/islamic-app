import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../generated/assets.dart';
import '../../data/model/feature_model.dart';

List<FeatureModel> featuredItems(context) => [
      FeatureModel(
        title: AppLocalizations.of(context)!.quranicButton,
        image: Assets.iconsTheHolyQuran,
        widget: RoutePath.quran,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.explanationButton,
        image: Assets.iconsExplanation,
        widget: RoutePath.tafsirScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.hadithsButton,
        image: Assets.iconsHadiths,
        widget: RoutePath.ahadithScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.praiseButton,
        image: Assets.iconsTasbih,
        widget: RoutePath.tasbeehScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.prayersButton,
        image: Assets.iconsHand,
        widget: RoutePath.prayersScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.prayerTimingsButton,
        image: Assets.iconsMosque,
        widget: RoutePath.prayerScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.remembranceButton,
        image: Assets.iconsMoon,
        widget: RoutePath.azkarScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.qibla,
        image: Assets.iconsQibla,
        widget: RoutePath.qiblaScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.namesOfAllah,
        image: Assets.iconsAllah,
        widget: RoutePath.namesOfAlluh,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.calendar,
        image: Assets.iconsTimeAndDate,
        widget: RoutePath.calendarScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.rookie,
        image: Assets.iconsRokia,
        widget: RoutePath.rookiaScreen,
      ),
      FeatureModel(
        title: AppLocalizations.of(context)!.zakat,
        image: Assets.iconsDonation,
        widget: RoutePath.zakatScreen,
      ),
    ];
