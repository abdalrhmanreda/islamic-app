import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/core/cache/hive_cache.dart';
import 'package:muslim_app/core/helpers/spacing.dart';
import 'package:muslim_app/core/methods/app_functions/app_functions.dart';
import 'package:quran/quran.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../core/methods/app_functions/hizb_data.dart';
import '../../../list_of_surahs/data/models/surha.dart';
import '../../../quran/ui/widgets/header.dart';
import '../../../quran/ui/widgets/quran_intro.dart';

class QuranKariemScreen extends StatefulWidget {
  const QuranKariemScreen({
    super.key,
    required this.pageNumber,
    required this.jsonData,
  });
  final int pageNumber;
  final List<Surah> jsonData;

  @override
  State<QuranKariemScreen> createState() => _QuranKariemScreenState();
}

class _QuranKariemScreenState extends State<QuranKariemScreen> {
  late int index;
  late PageController _pageController;
  late Timer timer;
  late String surahName;
  String selectedSpan = "";
  List<GlobalKey> richTextKeys = List.generate(604, (_) => GlobalKey());
  late int juz;
  @override
  void initState() {
    index = widget.pageNumber;
    _pageController = PageController(initialPage: index);
    juz = AppFunctions.getPartForPage(index);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    WakelockPlus.enable();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (a) {
          setState(() {
            selectedSpan = "";
            juz = AppFunctions.getPartForPage(a);
          });
          index = a;
          HiveCache.saveData(key: 'lastPage', value: index);
        },
        controller: _pageController,
        itemCount: totalPagesCount + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const QuranIntro();
          } else {
            return Column(
              children: [
                Header(
                  index: index,
                  name:
                      widget.jsonData[getPageData(index)[0]['surah'] - 1].name,
                  juz: juz,
                ),
                Spacing.verticalSpace(10),
                Expanded(
                  child: index == 1 || index == 2
                      ? Center(
                          child: Image.asset(
                            'assets/quran-images/$index.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      : Image.asset(
                          'assets/quran-images/$index.png',
                          fit: BoxFit.fill,
                        ),
                ),
                Spacing.verticalSpace(25),
              ],
            );
          }
        },
      ),
    );
  }
}
