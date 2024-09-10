import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:muslim_app/core/cache/hive_cache.dart';
import 'package:muslim_app/core/helpers/extensions.dart';
import 'package:quran/quran.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../quran_kariem/ui/screens/quran_kariem_screen.dart';
import '../../data/models/surha.dart';
import '../widgets/last_reading.dart';
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
  late int lastPage;
  @override
  void initState() {
    filteredData = widget.surahs;
    lastPage = HiveCache.getData(key: 'lastPage') ?? 1;
    super.initState();
  }

  void filterSurahs(String query) {
    setState(() {
      searchQuery = query;
      pageNumbers = [];
      ayatFiltered = null;

      if (query.isEmpty) {
        filteredData = widget.surahs;
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
    lastPage = HiveCache.getData(key: 'lastPage') ?? 1;
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
            LastReading(lastPage: lastPage, widget: widget),
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
                    HiveCache.saveData(
                      key: 'lastPage',
                      value: getPageNumber(filteredData[index].number, 1),
                    );
                    context.navigateToWidget(
                      context,
                      QuranKariemScreen(
                        pageNumber:
                            getPageNumber(filteredData[index].number, 1),
                        jsonData: filteredData,
                      ),
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
          ],
        ),
      ),
    );
  }
}
