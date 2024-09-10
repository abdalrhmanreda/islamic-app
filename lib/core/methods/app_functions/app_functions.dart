import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppFunctions {
  static bool isEmailValid(String email) {
    if (email.contains('@') && email.contains('.') && email.endsWith('.com')) {
      return true;
    } else {
      return false;
    }
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiry date is required';
    }

    // Validate if the input matches the format MM/YY
    if (!RegExp(r'^\d{0,2}/?\d{0,2}$').hasMatch(value)) {
      return 'Invalid expiry date format';
    }

    // Extract month and year from the input
    final parts = value.split('/');
    final month = int.tryParse(parts[0]) ?? 0;
    final year = int.tryParse(parts[1]) ?? 0;

    // Validate month (1-12) and year (0-99)
    if (month < 1 || month > 12 || year < 0 || year > 99) {
      return 'Invalid expiry date';
    }

    return null;
  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required';
    }

    // Validate if the input contains exactly 3 digits
    if (!RegExp(r'^\d{3}$').hasMatch(value)) {
      return 'CVV must be 3 digits';
    }

    return null;
  }

  static void formatExpiryDate(TextEditingController controller, String value) {
    if (value.length == 2 && !value.endsWith('/')) {
      controller.text = '$value/';
    } else if (value.length > 5) {
      controller.text = value.substring(0, 5);
    } else {
      controller.text = value;
    }
  }

  static String removeSubstrings(String address) {
    List<String> substringsToRemove = ["Governorate"];
    for (String substring in substringsToRemove) {
      address = address.replaceAll(substring, '').trim();
    }
    return address;
  }

  static String prayerTimeToString(String prayerTime, context) {
    if (prayerTime == 'fajrafter' || prayerTime == 'fajr') {
      return AppLocalizations.of(context)!.fajr;
    } else if (prayerTime == 'dhuhr') {
      return AppLocalizations.of(context)!.dhuhr;
    } else if (prayerTime == 'asr') {
      return AppLocalizations.of(context)!.asr;
    } else if (prayerTime == 'maghrib') {
      return AppLocalizations.of(context)!.maghrib;
    } else if (prayerTime == 'isha') {
      return AppLocalizations.of(context)!.isha;
    } else {
      return AppLocalizations.of(context)!.shuruq;
    }
  }

  static String getArabicOrdinal(int englishNumber) {
    if (englishNumber < 1 || englishNumber > 30) {
      return "الرقم خارج النطاق";
    }

    String suffix = 'th';

    if (englishNumber == 1) {
      return "الأول";
    } else if (englishNumber == 2) {
      return "الثاني";
    } else if (englishNumber == 3) {
      return "الثالث";
    } else if (englishNumber == 4) {
      return "الرابع";
    } else if (englishNumber == 5) {
      return "الخامس";
    } else if (englishNumber == 6) {
      return "السادس";
    } else if (englishNumber == 7) {
      return "السابع";
    } else if (englishNumber == 8) {
      return "الثامن";
    } else if (englishNumber == 9) {
      return "التاسع";
    } else if (englishNumber == 10) {
      return "العاشر";
    } else if (englishNumber == 11) {
      return "الحادي عشر";
    } else if (englishNumber == 12) {
      return "الثاني عشر";
    } else if (englishNumber == 13) {
      return "الثالث عشر";
    } else if (englishNumber == 14) {
      return "الرابع عشر";
    } else if (englishNumber == 15) {
      return "الخامس عشر";
    } else if (englishNumber == 16) {
      return "السادس عشر";
    } else if (englishNumber == 17) {
      return "السابع عشر";
    } else if (englishNumber == 18) {
      return "الثامن عشر";
    } else if (englishNumber == 19) {
      return "التاسع عشر";
    } else if (englishNumber == 20) {
      return "العشرون";
    } else if (englishNumber == 21) {
      return "الحادي والعشرون";
    } else if (englishNumber == 22) {
      return "الثاني والعشرون";
    } else if (englishNumber == 23) {
      return "الثالث والعشرون";
    } else if (englishNumber == 24) {
      return "الرابع والعشرون";
    } else if (englishNumber == 25) {
      return "الخامس والعشرون";
    } else if (englishNumber == 26) {
      return "السادس والعشرون";
    } else if (englishNumber == 27) {
      return "السابع والعشرون";
    } else if (englishNumber == 28) {
      return "الثامن والعشرون";
    } else if (englishNumber == 29) {
      return "التاسع والعشرون";
    } else {
      return "الثلاثون";
    }
  }

  static String zakerCategory(String category) {
    if (category == 'أذكار الصباح') {
      return 'moringAzkar';
    } else if (category == 'أذكار المساء') {
      return 'nightAzkar';
    } else if (category == 'أذكار النوم') {
      return 'sleepingAzkar';
    } else if (category == 'أذكار بعد السلام من الصلاة المفروضة') {
      return 'afterPrayerAzkar';
    } else {
      return 'wakeUpAzkar';
    }
  }

  static String convertNumberToArabic(String number) {
    const Map<String, String> arabicDigits = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };
    StringBuffer arabicNumber = StringBuffer();

    for (int i = 0; i < number.length; i++) {
      if (arabicDigits.containsKey(number[i])) {
        arabicNumber.write(arabicDigits[number[i]]);
      } else {
        arabicNumber
            .write(number[i]); // If not a digit, keep the character as is
      }
    }

    return arabicNumber.toString();
  }

  static int getPartForPage(int pageNumber) {
    if (pageNumber < 1 || pageNumber > 604) {
      throw ArgumentError('رقم الصفحة يجب أن يكون بين 1 و 604');
    }

    // Define the start pages for each part
    List<int> partStartPages = [
      1,
      22,
      42,
      62,
      82,
      102,
      122,
      142,
      162,
      182,
      201,
      221,
      241,
      261,
      281,
      301,
      321,
      341,
      361,
      381,
      401,
      421,
      441,
      461,
      481,
      501,
      521,
      541,
      561,
      582
    ];

    // Determine the part based on the page number
    for (int i = 0; i < partStartPages.length; i++) {
      if (pageNumber >= partStartPages[i] &&
          (i == partStartPages.length - 1 ||
              pageNumber < partStartPages[i + 1])) {
        return i + 1; // Parts are 1-indexed
      }
    }

    throw ArgumentError('رقم الصفحة غير صالح');
  }

  static double calculateZakat(double totalWealth, double nisabThreshold) {
    // Ensure the wealth exceeds the Nisab threshold
    if (totalWealth < nisabThreshold) {
      return 0.0; // No Zakat is due if wealth is below the Nisab threshold
    }

    // Calculate 2.5% of the total wealth
    double zakatAmount = totalWealth * 0.025;

    return zakatAmount;
  }
}
