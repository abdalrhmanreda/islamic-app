import 'package:bloc/bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith/classes.dart';
import 'package:hadith/hadith.dart';

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
      ];
  List<Book> imamBooks = [];
  void getImamBooks(String imam) {
    imamBooks = [];
    emit(const Loading());
    try {
      switch (imam) {
        case 'imamBukhari':
          imamBooks = getBooks(Collections.bukhari);
          break;

        case 'imamMuslim':
          imamBooks = getBooks(Collections.muslim);
          break;

        case 'imamTirmidhi':
          imamBooks = getBooks(Collections.tirmidhi);
          break;

        case 'imamAbuDawood':
          imamBooks = getBooks(Collections.abudawud);
          break;

        case 'imamNasai':
          imamBooks = getBooks(Collections.nasai);
          break;

        case 'imamIbnMajah':
          imamBooks = getBooks(Collections.ibnmajah);
          break;

        default:
          print("Imam not recognized");
          return;
      }
      emit(Loaded(imamBooks));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  List<ImamModel> imams(context) => [
        ImamModel(
          link:
              'https://ar.wikipedia.org/wiki/%D9%85%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%A5%D8%B3%D9%85%D8%A7%D8%B9%D9%8A%D9%84_%D8%A7%D9%84%D8%A8%D8%AE%D8%A7%D8%B1%D9%8A',
          brief: AppLocalizations.of(context)!.imam1,
          immamName: 'imamBukhari',
        ),
        ImamModel(
          brief: AppLocalizations.of(context)!.imam2,
          link:
              'https://ar.wikipedia.org/wiki/%D9%85%D8%B3%D9%84%D9%85_%D8%A8%D9%86_%D8%A7%D9%84%D8%AD%D8%AC%D8%A7%D8%AC#:~:text=%D8%A3%D8%A8%D9%88%20%D8%A7%D9%84%D8%AD%D8%B3%D9%8A%D9%86%20%D9%85%D8%B3%D9%84%D9%85%20%D8%A8%D9%86%20%D8%A7%D9%84%D8%AD%D8%AC%D8%A7%D8%AC,%D8%A7%D9%84%D8%AD%D8%AF%D9%8A%D8%AB%20%D8%B5%D8%BA%D9%8A%D8%B1%D9%8B%D8%A7%D8%8C%20%D9%88%D9%83%D8%A7%D9%86%20%D8%A3%D9%88%D9%84%20%D8%B3%D9%85%D8%A7%D8%B9',
          immamName: 'imamMuslim',
        ),
        ImamModel(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D9%88_%D8%B9%D9%8A%D8%B3%D9%89_%D9%85%D8%AD%D9%85%D8%AF_%D8%A7%D9%84%D8%AA%D8%B1%D9%85%D8%B0%D9%8A#:~:text=%D9%88%D9%84%D8%AF%20%D9%81%D9%8A%20%D8%AA%D8%B1%D9%85%D8%B0%20%D9%88%D8%A5%D9%84%D9%8A%D9%87%D8%A7%20%D9%8A%D9%8F%D9%86%D8%B3%D8%A8,%D9%83%D9%90%D8%A8%D8%B1%D9%87%20%D8%A8%D8%B9%D8%AF%20%D8%B1%D8%AD%D9%84%D8%AA%D9%87%20%D9%88%D9%83%D8%AA%D8%A7%D8%A8%D8%AA%D9%87%20%D8%A7%D9%84%D8%B9%D9%84%D9%85',
          brief: AppLocalizations.of(context)!.imam3,
          immamName: 'imamTirmidhi',
        ),
        ImamModel(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D9%88_%D8%AF%D8%A7%D9%88%D8%AF',
          brief: AppLocalizations.of(context)!.imam4,
          immamName: 'imamAbuDawood',
        ),
        ImamModel(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A3%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%B4%D8%B9%D9%8A%D8%A8_%D8%A7%D9%84%D9%86%D8%B3%D8%A7%D8%A6%D9%8A',
          brief: AppLocalizations.of(context)!.imam5,
          immamName: 'imamNasai',
        ),
        ImamModel(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A7%D8%A8%D9%86_%D9%85%D8%A7%D8%AC%D9%87',
          brief: AppLocalizations.of(context)!.imam6,
          immamName: 'imamIbnMajah',
        ),
      ];
}
