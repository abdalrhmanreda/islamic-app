import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart';

import '../screens/surah_details_screen.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.widget,
    required this.index,
  });

  final SurahDetailsScreen widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.w,
        left: 15.w,
        right: 15.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${AppLocalizations.of(context)!.surah} ${widget.jsonData[getPageData(index)[0]['surah'] - 1].name}',
            style: TextStyle(
              fontFamily: 'uthmanic',
              fontSize: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
