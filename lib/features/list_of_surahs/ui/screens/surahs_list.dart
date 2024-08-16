import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:muslim_app/core/helpers/extensions.dart';
import 'package:quran/quran.dart';
import 'package:string_validator/string_validator.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../quran/ui/screens/surah_details_screen.dart';
import '../../data/models/surha.dart';
import '../widgets/surahs_part.dart';

class SurahsList extends StatefulWidget {
  const SurahsList({super.key, required this.surahs});
  final List<Surah> surahs;

  @override
  State<SurahsList> createState() => _SurahsListState();
}

class _SurahsListState extends State<SurahsList> {
  String searchQuery = "";
  List<Surah> filteredData = [];
  List<int> pageNumbers = [];
  Map<String, dynamic>? ayatFiltered;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    filteredData = widget.surahs;
    super.initState();
  }

  void filterSurahs(String query) {
    setState(() {
      searchQuery = query;
      pageNumbers = [];
      ayatFiltered = null;

      if (query.isEmpty) {
        filteredData = widget.surahs;
      } else if (isInt(query)) {
        num pageNumber = toInt(query);
        if (pageNumber > 0 && pageNumber < 605) {
          pageNumbers.add(pageNumber.toInt());
          filteredData = [];
        }
      } else if (query.length > 2 || query.contains(" ")) {
        filteredData = widget.surahs.where((sura) {
          final suraName = sura.englishName.toLowerCase();
          final suraNameTranslated =
              getSurahNameArabic(sura.number).toLowerCase();
          return suraName.contains(query.toLowerCase()) ||
              suraNameTranslated.contains(query.toLowerCase());
        }).toList();

        if (filteredData.isEmpty) {
          ayatFiltered = Map<String, dynamic>.from(searchWords(query));
        }
      } else {
        filteredData = widget.surahs;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isCenter: true,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_right_1_outline),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppLocalizations.of(context)!.quranicButton,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.semiBold,
                )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 10.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: textEditingController,
                onChanged: filterSurahs,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!
                      .searchWithPageNumberOrSurahNameOrAya,
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.kGreyColor,
                        fontSize: 16.sp,
                      ),
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (filteredData.isNotEmpty)
              ListView.builder(
                padding: EdgeInsets.only(
                  top: 10.h,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredData.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.navigateToWidget(
                      context,
                      SurahDetailsScreen(
                          pageNumber:
                              getPageNumber(filteredData[index].number, 1),
                          shouldHighlightText: false,
                          highlightVerse: "",
                          jsonData: (filteredData)),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(15),
                    width: AppConstant.deviceWidth(context),
                    child: SurahListItem(
                      englishName: filteredData[index].englishName,
                      numberOfAyahs: filteredData[index].numberOfAyahs,
                      number: filteredData[index].number,
                      surahName: filteredData[index].name,
                    ),
                  ),
                ),
              ),
            if (ayatFiltered != null)
              ListView.separated(
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const Divider(),
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ayatFiltered!["occurences"] > 15
                    ? 15
                    : ayatFiltered!["occurences"],
                itemBuilder: (context, index) {
                  final ayat = ayatFiltered!["result"][index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.kCircleAvatarColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.kLightGreyColor,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.surah} ${getSurahNameArabic(ayat["surah"])}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18.sp,
                                  fontFamily: 'Amiri',
                                  fontWeight: FontWeightHelper.semiBold,
                                ),
                          ),
                          Text(
                            " ${getVerse(ayat["surah"], ayat["verse"], verseEndSymbol: true)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16.sp,
                                  fontFamily: 'Amiri',
                                  fontWeight: FontWeightHelper.regular,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
