// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:muslim/core/helpers/extensions.dart';
// import 'package:muslim/core/methods/app_functions/app_functions.dart';
// import 'package:muslim/features/quran/logic/surah_details_cubit.dart';
// import 'package:muslim/features/quran/logic/surah_details_state.dart';
// import 'package:muslim/features/quran/ui/widgets/surahs_part.dart';
// import 'package:quran/quran.dart' as quran;
//
// import '../../../../config/routes/routes_path.dart';
// import '../../data/model/surah_model.dart';
// import '../widgets/item_in_surahs_list.dart';
//
// class JuzsPart extends StatelessWidget {
//   const JuzsPart({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SurahDetailsCubit, SurahDetailsState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return context.read<SurahDetailsCubit>().searchResults.isNotEmpty
//             ? const SurahsPart()
//             : ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: 30,
//                 itemBuilder: (context, index) {
//                   final surahAndVerses =
//                       quran.getSurahAndVersesFromJuz(index + 1);
//                   final surahKeys = surahAndVerses.keys.toList();
//
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${AppLocalizations.of(context)!.aljuz} ${AppFunctions.getArabicOrdinal(index + 1)}',
//                       ),
//                       ListView(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         children: List.generate(
//                           surahKeys.length,
//                           (subIndex) => ItemInTheSurahList(
//                             onTap: () {
//                               context.navigateToWidgetByNamed(
//                                 context,
//                                 RoutePath.quranDetail,
//                                 arguments: SurahModel(
//                                   name: quran
//                                       .getSurahNameArabic(surahKeys[subIndex]),
//                                   index: surahKeys[subIndex],
//                                 ),
//                               );
//                             },
//                             index: surahKeys[subIndex],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               );
//       },
//     );
//   }
// }
