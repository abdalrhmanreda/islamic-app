import 'package:arabic_tools/arabic_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadith/classes.dart';
import 'package:hadith/hadith.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:muslim_app/config/colors/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class BookHadithsScreen extends StatelessWidget {
  const BookHadithsScreen({
    super.key,
    required this.hadithsCount,
    required this.bookNumber,
    required this.title,
    required this.immamName,
  });

  final int hadithsCount;
  final String bookNumber;
  final String title;
  final String immamName;

  @override
  Widget build(BuildContext context) {
    // Handle different cases for bookNumber
    final bookNumberValue = _parseBookNumber(bookNumber);

    return Scaffold(
      appBar: AppBar(
        title: Text(Arabic_Tools().RemoveTashkeel(title)),
      ),
      body: ListView.builder(
        itemCount: hadithsCount,
        itemBuilder: (context, index) {
          // Ensure getHadith is provided with valid arguments
          final hadith = _getHadith(immamName, bookNumberValue, index + 1);

          return Container(
            alignment: Alignment.center,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: AppColors.kCircleAvatarColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Arabic_Tools().RemoveTashkeel(
                    removeNonArabic(hadith.hadith[1].body),
                  ),
                  style: TextStyle(
                    color: AppColors.kButtonColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0.sp,
                    fontFamily: 'amiri',
                    height: 2,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Divider(),
                Row(
                  children: [
                    Transform.rotate(
                      angle: -45,
                      child: IconButton(
                        onPressed: () {
                          // share text
                          Share.share(
                            removeNonArabic(hadith.hadith[1].body),
                          );
                        },
                        icon: const Icon(Iconsax.direct_right_outline),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: removeNonArabic(hadith.hadith[1].body),
                            ),
                          ).then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    AppLocalizations.of(context)!
                                        .copyTextInClipBoard,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.kWhiteColor,
                                        ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Iconsax.copy_outline)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  dynamic _parseBookNumber(String bookNumber) {
    // Check if the bookNumber is "introduction"
    if (bookNumber.toLowerCase() == 'introduction') {
      return 'introduction';
    }
    // Try parsing the bookNumber to an integer
    return int.tryParse(bookNumber);
  }

  Hadith _getHadith(
      String immamName, dynamic bookNumberValue, int hadithNumber) {
    switch (immamName) {
      case 'imamBukhari':
        return getHadith(Collections.bukhari, bookNumberValue, hadithNumber);
      case 'imamMuslim':
        return getHadith(Collections.muslim, bookNumberValue, hadithNumber);
      case 'imamTirmidhi':
        return getHadith(Collections.tirmidhi, bookNumberValue, hadithNumber);
      case 'imamAbuDawood':
        return getHadith(Collections.abudawud, bookNumberValue, hadithNumber);
      case 'imamNasai':
        return getHadith(Collections.nasai, bookNumberValue, hadithNumber);
      case 'imamIbnMajah':
        return getHadith(Collections.ibnmajah, bookNumberValue, hadithNumber);
      default:
        throw ArgumentError('Unknown imam name: $immamName');
    }
  }

  String removeNonArabic(String text) {
    final arabicRegex = RegExp(r'[^\u0600-\u06FF\s]');
    return text.replaceAll(arabicRegex, '');
  }
}
