import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/config/colors/app_colors.dart';
import 'package:quran/quran.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../list_of_surahs/data/models/surha.dart';
import '../widgets/basmallah.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/header_widget.dart';
import '../widgets/quran_intro.dart';

class SurahDetailsScreen extends StatefulWidget {
  final int pageNumber;
  final List<Surah> jsonData;
  final bool? shouldHighlightText;
  final String? highlightVerse;

  const SurahDetailsScreen({
    Key? key,
    required this.pageNumber,
    required this.jsonData,
    this.shouldHighlightText,
    this.highlightVerse,
  }) : super(key: key);

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  late int index;
  late PageController _pageController;
  late Timer timer;
  String selectedSpan = "";
  List<GlobalKey> richTextKeys = List.generate(604, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    index = widget.pageNumber;
    _pageController = PageController(initialPage: index);
    _highlightVerse();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    WakelockPlus.enable();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    WakelockPlus.disable();
    super.dispose();
  }

  void _highlightVerse() {
    if (widget.shouldHighlightText == true) {
      timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
        if (mounted) {
          setState(() {
            selectedSpan = widget.highlightVerse ?? "";
          });

          Timer(const Duration(milliseconds: 200), () {
            if (mounted) {
              setState(() {
                selectedSpan = "";
              });
            }
            if (timer.tick == 4) {
              timer.cancel();
            }
          });
        }
      });
    }
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
          });
          index = a;
        },
        controller: _pageController,
        itemCount: totalPagesCount + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const QuranIntro();
          }

          return SizedBox(
            height: AppConstant.deviceHeight(context),
            child: Column(
              children: [
                Header(widget: widget, index: index),
                if (index == 1 || index == 2)
                  SizedBox(
                    height: AppConstant.deviceHeight(context) * .15,
                  ),
                Spacing.verticalSpace(15),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              child: RichText(
                                key: richTextKeys[index - 1],
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                locale: const Locale("ar"),
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26.sp,
                                  ),
                                  children: _getPageSpans(index),
                                ),
                              ),
                            ),
                            Footer(
                              index: index,
                              surahName: widget
                                  .jsonData[getPageData(index)[0]['surah'] - 1]
                                  .name,
                              surahNumber: getPageData(index)[0]['surah'],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<InlineSpan> _getPageSpans(int index) {
    return getPageData(index).expand((e) {
      List<InlineSpan> spans = [];
      for (var i = e["start"]; i <= e["end"]; i++) {
        if (i == 1) {
          spans.add(
              WidgetSpan(child: HeaderWidget(e: e, jsonData: widget.jsonData)));
          if (index != 187 && index != 1) {
            spans.add(WidgetSpan(child: Basmallah(index: 1)));
          }
          if (index == 187) {
            spans.add(WidgetSpan(child: Container(height: 10)));
          }
        }

        spans.add(TextSpan(
          recognizer: LongPressGestureRecognizer()
            ..onLongPress = () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 26.sp,
                            ),
                          ),
                        ),
                        Spacing.verticalSpace(10),
                    Column(
                      children: [
                        Text(
                          widget.jsonData[getPageData(index)[0]['surah'] - 1]
                              .name,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacing.verticalSpace(10),
                        Text(
                          getVerse(e["surah"], i),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Amiri',
                          ),
                        ),
                        Spacing.verticalSpace(10),




                      ],
                    ),

                      ],
                    );
                  });
            }
            ..onLongPressDown = (details) {
              setState(() {
                selectedSpan = " ${e["surah"]}$i";
              });
            }
            ..onLongPressUp = () {
              setState(() {
                selectedSpan = "";
              });
            }
            ..onLongPressCancel = () {
              setState(() {
                selectedSpan = "";
              });
            },
          text: i == e["start"]
              ? "${getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(0, 1)}\u200A${getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(1)}"
                  .replaceAll(" ", "")
              : getVerseQCF(e["surah"], i).replaceAll(" ", ""),
          style: TextStyle(
            color: Colors.black,
            height: (index == 1 || index == 2) ? 2 : 1.95,
            letterSpacing: 0,
            wordSpacing: 0,
            fontFamily: "QCF_P${index.toString().padLeft(3, "0")}",
            fontSize: index == 1 || index == 2
                ? 28
                : index == 145 || index == 201
                    ? index == 532 || index == 533
                        ? 23.sp
                        : 23.sp
                    : 23.sp,
            backgroundColor: _getBackgroundColor(e["surah"], i),
          ),
        ));
      }
      return spans;
    }).toList();
  }

  Color _getBackgroundColor(int surah, int verse) {
    if (widget.shouldHighlightText == true) {
      return getVerse(surah, verse) == widget.highlightVerse ||
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
