import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../config/routes/routes_path.dart';
import '../../../generated/assets.dart';
import '../../home/data/model/feature_model.dart';
import '../data/model/imam_model.dart';
import 'ahadith_state.dart';

class AhadithCubit extends Cubit<AhadithState> {
  AhadithCubit() : super(const AhadithState.initial());

  List<FeatureModel> ahadithBooks(context) => [
        FeatureModel(
          title: AppLocalizations.of(context)!.imamBukhari,
          image: Assets.iconsHadiths,
          widget: RoutePath.ahadithDetailsScreen,
        ),
        FeatureModel(
          title: AppLocalizations.of(context)!.imamMuslim,
          image: Assets.iconsHadiths,
          widget: RoutePath.ahadithDetailsScreen,
        ),
        FeatureModel(
          title: AppLocalizations.of(context)!.imamTirmidhi,
          image: Assets.iconsHadiths,
          widget: RoutePath.ahadithDetailsScreen,
        ),
        FeatureModel(
          title: AppLocalizations.of(context)!.imamAbuDawood,
          image: Assets.iconsHadiths,
          widget: RoutePath.ahadithDetailsScreen,
        ),
        FeatureModel(
          title: AppLocalizations.of(context)!.imamNasai,
          image: Assets.iconsHadiths,
          widget: RoutePath.ahadithDetailsScreen,
        ),
        FeatureModel(
          title: AppLocalizations.of(context)!.imamIbnMajah,
          image: Assets.iconsHadiths,
          widget: RoutePath.ahadithDetailsScreen,
        ),
        FeatureModel(
          title: AppLocalizations.of(context)!.imamMalik,
          image: Assets.iconsHadiths,
          widget: RoutePath.ahadithDetailsScreen,
        ),
        FeatureModel(
          title: AppLocalizations.of(context)!.imamAhmadIbnHanbal,
          image: Assets.iconsHadiths,
          widget: RoutePath.ahadithDetailsScreen,
        ),
      ];

  List<String> imamBukhari = [];
  List<String> imamMuslim = [];
  List<String> imamTirmidhi = [];
  List<String> imamAbuDawood = [];
  List<String> imamNasai = [];
  List<String> imamIbnMajah = [];
  List<String> imamMalik = [];
  List<String> imamAhmadIbnHanbal = [];

  List<List<String>> books = [];

  Future<void> getAhadith() async {
    emit(const AhadithState.loading());

    try {
      // Load all files asynchronously
      // List<String> filePaths = [
      //   Assets.ahadithBukhari,
      //   Assets.ahadithMuslim,
      //   Assets.ahadithDarimi,
      //   Assets.ahadithAbuDaud,
      //   Assets.ahadithNasai,
      //   Assets.ahadithIbnuMajah,
      //   Assets.ahadithMalik,
      //   Assets.ahadithAhmed
      // ];

      // List<String> data = await Future.wait(
      //     filePaths.map((path) => rootBundle.loadString(path)));

      // Process and extract main text from each list of Hadith
      // imamBukhari = processHadith(data[0]);
      // imamMuslim = processHadith(data[1]);
      // imamTirmidhi = processHadith(data[2]);
      // imamAbuDawood = processHadith(data[3]);
      // imamNasai = processHadith(data[4]);
      // imamIbnMajah = processHadith(data[5]);
      // imamMalik = processHadith(data[6]);
      // imamAhmadIbnHanbal = processHadith(data[7]);

      books = [
        imamBukhari,
        imamMuslim,
        imamTirmidhi,
        imamAbuDawood,
        imamNasai,
        imamIbnMajah,
        imamMalik,
        imamAhmadIbnHanbal
      ];

      emit(AhadithState.loaded(
          imamBukhari)); // Emit the loaded state with imamBukhari list
    } catch (e) {
      emit(AhadithState.error(e.toString()));
    }
  }

  List<String> processHadith(String rawText) {
    // Split the raw text by empty lines
    List<String> hadiths = rawText.split('\n');

    // Remove empty strings and trim whitespace from each extracted text
    return hadiths
        .where((hadith) => hadith.trim().isNotEmpty)
        .map((hadith) => hadith.trim())
        .toList();
  }

  List<ImamModel> imams(context) => [
        ImamModel(
            link:
                'https://ar.wikipedia.org/wiki/%D9%85%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%A5%D8%B3%D9%85%D8%A7%D8%B9%D9%8A%D9%84_%D8%A7%D9%84%D8%A8%D8%AE%D8%A7%D8%B1%D9%8A',
            brief: AppLocalizations.of(context)!.imam1),
        ImamModel(
          brief: AppLocalizations.of(context)!.imam2,
          link:
              'https://ar.wikipedia.org/wiki/%D9%85%D8%B3%D9%84%D9%85_%D8%A8%D9%86_%D8%A7%D9%84%D8%AD%D8%AC%D8%A7%D8%AC#:~:text=%D8%A3%D8%A8%D9%88%20%D8%A7%D9%84%D8%AD%D8%B3%D9%8A%D9%86%20%D9%85%D8%B3%D9%84%D9%85%20%D8%A8%D9%86%20%D8%A7%D9%84%D8%AD%D8%AC%D8%A7%D8%AC,%D8%A7%D9%84%D8%AD%D8%AF%D9%8A%D8%AB%20%D8%B5%D8%BA%D9%8A%D8%B1%D9%8B%D8%A7%D8%8C%20%D9%88%D9%83%D8%A7%D9%86%20%D8%A3%D9%88%D9%84%20%D8%B3%D9%85%D8%A7%D8%B9',
        ),
        ImamModel(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D9%88_%D8%B9%D9%8A%D8%B3%D9%89_%D9%85%D8%AD%D9%85%D8%AF_%D8%A7%D9%84%D8%AA%D8%B1%D9%85%D8%B0%D9%8A#:~:text=%D9%88%D9%84%D8%AF%20%D9%81%D9%8A%20%D8%AA%D8%B1%D9%85%D8%B0%20%D9%88%D8%A5%D9%84%D9%8A%D9%87%D8%A7%20%D9%8A%D9%8F%D9%86%D8%B3%D8%A8,%D9%83%D9%90%D8%A8%D8%B1%D9%87%20%D8%A8%D8%B9%D8%AF%20%D8%B1%D8%AD%D9%84%D8%AA%D9%87%20%D9%88%D9%83%D8%AA%D8%A7%D8%A8%D8%AA%D9%87%20%D8%A7%D9%84%D8%B9%D9%84%D9%85',
          brief: AppLocalizations.of(context)!.imam3,
        ),
        ImamModel(
            link:
                'https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D9%88_%D8%AF%D8%A7%D9%88%D8%AF',
            brief: AppLocalizations.of(context)!.imam4),
        ImamModel(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A3%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%B4%D8%B9%D9%8A%D8%A8_%D8%A7%D9%84%D9%86%D8%B3%D8%A7%D8%A6%D9%8A',
          brief: AppLocalizations.of(context)!.imam5,
        ),
        ImamModel(
            link:
                'https://ar.wikipedia.org/wiki/%D8%A7%D8%A8%D9%86_%D9%85%D8%A7%D8%AC%D9%87',
            brief: AppLocalizations.of(context)!.imam6),
        ImamModel(
          link:
              'https://islamonline.net/%D9%85%D8%A7%D9%84%D9%83-%D8%A8%D9%86-%D8%A3%D9%86%D8%B3-%D8%B5%D8%A7%D8%AD%D8%A8-%D8%A7%D9%84%D9%85%D9%88%D8%B7%D8%A3-%D9%88%D8%B3%D9%8A%D8%AF-%D8%A7%D9%84%D8%A3%D8%A6%D9%85%D8%A9/#:~:text=%D9%88%D9%8F%D9%84%D8%AF%20%D8%A7%D9%84%D8%A5%D9%85%D8%A7%D9%85%20%D9%85%D8%A7%D9%84%D9%83%20%D8%A8%D8%A7%D9%84%D9%85%D8%AF%D9%8A%D9%86%D8%A9%20%D8%A7%D9%84%D9%85%D9%86%D9%88%D8%B1%D8%A9,%D8%A7%D9%84%D8%B9%D9%84%D9%85%D8%A7%D8%A1%20%D9%85%D8%AB%D9%84%20%D9%86%D8%A7%D9%81%D8%B9%20%D9%85%D9%88%D9%84%D9%89%20%D8%A7%D8%A8%D9%86',
          brief: AppLocalizations.of(context)!.imam7,
        ),
        ImamModel(
            link:
                'https://ar.wikipedia.org/wiki/%D8%A3%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%AD%D9%86%D8%A8%D9%84#:~:text=%D8%A7%D8%B4%D8%AA%D9%8F%D9%87%D8%B1%20%D8%A8%D8%B9%D9%84%D9%85%D9%87%20%D8%A7%D9%84%D8%BA%D8%B2%D9%8A%D8%B1%20%D9%88%D8%AD%D9%81%D8%B8%D9%87%20%D8%A7%D9%84%D9%82%D9%88%D9%8A,%D9%85%D9%86%20%D8%A3%D8%B4%D9%87%D8%B1%20%D9%83%D8%AA%D8%A8%20%D8%A7%D9%84%D8%AD%D8%AF%D9%8A%D8%AB%20%D9%88%D8%A3%D9%88%D8%B3%D8%B9%D9%87%D8%A7',
            brief: AppLocalizations.of(context)!.imam8),
      ];
}
