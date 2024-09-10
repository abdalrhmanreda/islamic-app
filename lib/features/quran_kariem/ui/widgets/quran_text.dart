import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/core/methods/get_responsive_text/responsive_text.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/quran.dart';

import '../../../list_of_surahs/data/models/surha.dart';
import '../../../quran/ui/widgets/basmallah.dart';
import '../../../quran/ui/widgets/footer.dart';
import '../widgets/end_of_verse.dart';
import '../widgets/name_of_surah.dart';

class QuranFooter extends StatelessWidget {
  const QuranFooter({
    Key? key,
    required this.index,
    required this.jsonData,
  }) : super(key: key);

  final int index;
  final List<Surah> jsonData;

  @override
  Widget build(BuildContext context) {
    return Footer(
      index: index,
    );
  }
}

class QuranTextContent extends StatelessWidget {
  const QuranTextContent({
    Key? key,
    required this.pageIndex,
    required this.jsonData,
    required this.richTextKey,
    required this.selectedSpan,
    this.highlightVerse,
    this.shouldHighlightText,
  }) : super(key: key);

  final int pageIndex;
  final List<Surah> jsonData;
  final GlobalKey richTextKey;
  final String selectedSpan;
  final String? highlightVerse;
  final bool? shouldHighlightText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.zero,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: RichText(
            key: richTextKey,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            locale: const Locale("ar"),
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 26.sp),
              children: getPageDataSpan(pageIndex, context),
            ),
          ),
        ),
      ),
    );
  }

  List<InlineSpan> getPageDataSpan(int pageIndex, context) {
    List<Map<String, dynamic>> getPageData(int pageIndex) {
      List<Map<String, dynamic>> data = [];
      for (int surah = 1; surah <= 114; surah++) {
        for (int verse = 1; verse <= quran.getVerseCount(surah); verse++) {
          if (quran.getPageNumber(surah, verse) == pageIndex) {
            data.add({"surah": surah, "verse": verse});
          }
        }
      }
      return data;
    }

    return getPageData(pageIndex).expand((e) {
      List<InlineSpan> spans = [];
      int surah = e["surah"];
      int verse = e["verse"];

      if (verse == 1) {
        spans.add(WidgetSpan(child: NameOfSurah(surah: surah)));
        if (surah != 105 && pageIndex != 1) {
          spans.add(WidgetSpan(child: Basmallah(index: 1)));
        }
        if (pageIndex == 105) {
          spans.add(WidgetSpan(child: Container(height: 1)));
        }
      }

      spans.add(
        TextSpan(
          text: quran.getVerse(surah, verse),
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'hafc',
            wordSpacing: 0,
            letterSpacing: 0,
            height: (pageIndex == 1 || pageIndex == 2) ? 2 : 1.95,
            fontSize: getResponsiveFontSize(context, fontSize: 23),
            backgroundColor: _getBackgroundColor(surah, verse),
          ),
          children: [WidgetSpan(child: EndOfVerse(verse: verse.toString()))],
        ),
      );

      return spans;
    }).toList();
  }

  Color _getBackgroundColor(int surah, int verse) {
    if (shouldHighlightText == true) {
      return getVerse(surah, verse) == highlightVerse ||
              selectedSpan == " $surah$verse"
          ? Colors.orange.withOpacity(.25)
          : Colors.transparent;
    } else {
      return selectedSpan == " $surah$verse"
          ? Colors.orange.withOpacity(.25)
          : Colors.transparent;
    }
  }
}
