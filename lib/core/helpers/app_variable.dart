import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppVariable {
  static Map<String, String> recitersUrls = {
    'ماهر المعقيلي':
        'https://server12.mp3quran.net/maher/Almusshaf-Al-Mojawwad/',
    'ياسر الدوسرى': 'https://server11.mp3quran.net/yasser/',
    'ابراهيم الاخصر': 'https://server6.mp3quran.net/akdr/002.mp3',
    'محمد الطبلاوي': 'https://server12.mp3quran.net/tblawi/',
    'محمد اللحيدان': 'https://server8.mp3quran.net/lhdan/',
    'محمد ايوب':
        'https://server16.mp3quran.net/ayyoub2/Rewayat-Hafs-A-n-Assem/',
    'محمد جبريل': 'https://server8.mp3quran.net/jbrl/',
    'محمد صديق المنشاوي':
        'https://server10.mp3quran.net/minsh/Almusshaf-Al-Mo-lim/',
    'محمود خليل الحصري':
        'https://server13.mp3quran.net/husr/Rewayat-Qalon-A-n-Nafi/',
    'محمود علي البنا':
        'https://server8.mp3quran.net/bna/Almusshaf-Al-Mojawwad/',
    'مشاري العفاسي':
        'https://server8.mp3quran.net/afs/Rewayat-AlDorai-A-n-Al-Kisa-ai/',
    'أحمد طالب بن حميد':
        'https://server16.mp3quran.net/a_binhameed/Rewayat-Hafs-A-n-Assem/',
    'عبدالباسط عبدالصمد': 'https://server7.mp3quran.net/basit/',
    'خالد الجليل': 'https://server10.mp3quran.net/jleel/',
  };
  static String currentReciter = 'ماهر المعقيلي';
  static String currentLanguage = 'العربية';
  static String currentTheme = 'الأساسي';
  static double currentFontSize = 16.sp;
  static double numberOfVerseFontSize = 12.sp;
  static int currentIndex = 0;
  static List<Map<String, dynamic>> quranSurahs = [
    {
      'number': 1,
      'arabic': 'الفاتحة',
      'english': 'Al-Fatiha',
      'ayahs': 7,
      'type': 'Makkiyah'
    },
    {
      'number': 2,
      'arabic': 'البقرة',
      'english': 'Al-Baqarah',
      'ayahs': 286,
      'type': 'Madaniyah'
    },
    {
      'number': 3,
      'arabic': 'آل عمران',
      'english': 'Aal-E-Imran',
      'ayahs': 200,
      'type': 'Madaniyah'
    },
    {
      'number': 4,
      'arabic': 'النساء',
      'english': 'An-Nisa',
      'ayahs': 176,
      'type': 'Madaniyah'
    },
    {
      'number': 5,
      'arabic': 'المائدة',
      'english': 'Al-Ma\'idah',
      'ayahs': 120,
      'type': 'Madaniyah'
    },
    {
      'number': 6,
      'arabic': 'الأنعام',
      'english': 'Al-An\'am',
      'ayahs': 165,
      'type': 'Makkiyah'
    },
    {
      'number': 7,
      'arabic': 'الأعراف',
      'english': 'Al-A\'raf',
      'ayahs': 206,
      'type': 'Makkiyah'
    },
    {
      'number': 8,
      'arabic': 'الأنفال',
      'english': 'Al-Anfal',
      'ayahs': 75,
      'type': 'Madaniyah'
    },
    {
      'number': 9,
      'arabic': 'التوبة',
      'english': 'At-Tawbah',
      'ayahs': 129,
      'type': 'Madaniyah'
    },
    {
      'number': 10,
      'arabic': 'يونس',
      'english': 'Yunus',
      'ayahs': 109,
      'type': 'Makkiyah'
    },
    {
      'number': 11,
      'arabic': 'هود',
      'english': 'Hud',
      'ayahs': 123,
      'type': 'Makkiyah'
    },
    {
      'number': 12,
      'arabic': 'يوسف',
      'english': 'Yusuf',
      'ayahs': 111,
      'type': 'Makkiyah'
    },
    {
      'number': 13,
      'arabic': 'الرعد',
      'english': 'Ar-Ra\'d',
      'ayahs': 43,
      'type': 'Madaniyah'
    },
    {
      'number': 14,
      'arabic': 'إبراهيم',
      'english': 'Ibrahim',
      'ayahs': 52,
      'type': 'Makkiyah'
    },
    {
      'number': 15,
      'arabic': 'الحجر',
      'english': 'Al-Hijr',
      'ayahs': 99,
      'type': 'Makkiyah'
    },
    {
      'number': 16,
      'arabic': 'النحل',
      'english': 'An-Nahl',
      'ayahs': 128,
      'type': 'Makkiyah'
    },
    {
      'number': 17,
      'arabic': 'الإسراء',
      'english': 'Al-Isra',
      'ayahs': 111,
      'type': 'Makkiyah'
    },
    {
      'number': 18,
      'arabic': 'الكهف',
      'english': 'Al-Kahf',
      'ayahs': 110,
      'type': 'Makkiyah'
    },
    {
      'number': 19,
      'arabic': 'مريم',
      'english': 'Maryam',
      'ayahs': 98,
      'type': 'Makkiyah'
    },
    {
      'number': 20,
      'arabic': 'طه',
      'english': 'Taha',
      'ayahs': 135,
      'type': 'Makkiyah'
    },
    {
      'number': 21,
      'arabic': 'الأنبياء',
      'english': 'Al-Anbiya',
      'ayahs': 112,
      'type': 'Makkiyah'
    },
    {
      'number': 22,
      'arabic': 'الحج',
      'english': 'Al-Hajj',
      'ayahs': 78,
      'type': 'Makkiyah'
    },
    {
      'number': 23,
      'arabic': 'المؤمنون',
      'english': 'Al-Mu\'minun',
      'ayahs': 118,
      'type': 'Makkiyah'
    },
    {
      'number': 24,
      'arabic': 'النور',
      'english': 'An-Nur',
      'ayahs': 64,
      'type': 'Madaniyah'
    },
    {
      'number': 25,
      'arabic': 'الفرقان',
      'english': 'Al-Furqan',
      'ayahs': 77,
      'type': 'Makkiyah'
    },
    {
      'number': 26,
      'arabic': 'الشعراء',
      'english': 'Ash-Shu\'ara',
      'ayahs': 227,
      'type': 'Makkiyah'
    },
    {
      'number': 27,
      'arabic': 'النمل',
      'english': 'An-Naml',
      'ayahs': 93,
      'type': 'Makkiyah'
    },
    {
      'number': 28,
      'arabic': 'القصص',
      'english': 'Al-Qasas',
      'ayahs': 88,
      'type': 'Makkiyah'
    },
    {
      'number': 29,
      'arabic': 'العنكبوت',
      'english': 'Al-Ankabut',
      'ayahs': 69,
      'type': 'Makkiyah'
    },
    {
      'number': 30,
      'arabic': 'الروم',
      'english': 'Ar-Rum',
      'ayahs': 60,
      'type': 'Makkiyah'
    },
    {
      'number': 31,
      'arabic': 'لقمان',
      'english': 'Luqman',
      'ayahs': 34,
      'type': 'Makkiyah'
    },
    {
      'number': 32,
      'arabic': 'السجدة',
      'english': 'As-Sajda',
      'ayahs': 30,
      'type': 'Makkiyah'
    },
    {
      'number': 33,
      'arabic': 'الأحزاب',
      'english': 'Al-Ahzab',
      'ayahs': 73,
      'type': 'Madaniyah'
    },
    {
      'number': 34,
      'arabic': 'سبأ',
      'english': 'Saba',
      'ayahs': 54,
      'type': 'Makkiyah'
    },
    {
      'number': 35,
      'arabic': 'فاطر',
      'english': 'Fatir',
      'ayahs': 45,
      'type': 'Makkiyah'
    },
    {
      'number': 36,
      'arabic': 'يس',
      'english': 'Ya-Sin',
      'ayahs': 83,
      'type': 'Makkiyah'
    },
    {
      'number': 37,
      'arabic': 'الصافات',
      'english': 'As-Saffat',
      'ayahs': 182,
      'type': 'Makkiyah'
    },
    {
      'number': 38,
      'arabic': 'ص',
      'english': 'Sad',
      'ayahs': 88,
      'type': 'Makkiyah'
    },
    {
      'number': 39,
      'arabic': 'الزمر',
      'english': 'Az-Zumar',
      'ayahs': 75,
      'type': 'Makkiyah'
    },
    {
      'number': 40,
      'arabic': 'غافر',
      'english': 'Ghafir',
      'ayahs': 85,
      'type': 'Makkiyah'
    },
    {
      'number': 41,
      'arabic': 'فصلت',
      'english': 'Fussilat',
      'ayahs': 54,
      'type': 'Makkiyah'
    },
    {
      'number': 42,
      'arabic': 'الشورى',
      'english': 'Ash-Shura',
      'ayahs': 53,
      'type': 'Makkiyah'
    },
    {
      'number': 43,
      'arabic': 'الزخرف',
      'english': 'Az-Zukhruf',
      'ayahs': 89,
      'type': 'Makkiyah'
    },
    {
      'number': 44,
      'arabic': 'الدخان',
      'english': 'Ad-Dukhan',
      'ayahs': 59,
      'type': 'Makkiyah'
    },
    {
      'number': 45,
      'arabic': 'الجاثية',
      'english': 'Al-Jathiya',
      'ayahs': 37,
      'type': 'Makkiyah'
    },
    {
      'number': 46,
      'arabic': 'الأحقاف',
      'english': 'Al-Ahqaf',
      'ayahs': 35,
      'type': 'Makkiyah'
    },
    {
      'number': 47,
      'arabic': 'محمد',
      'english': 'Muhammad',
      'ayahs': 38,
      'type': 'Madaniyah'
    },
    {
      'number': 48,
      'arabic': 'الفتح',
      'english': 'Al-Fath',
      'ayahs': 29,
      'type': 'Madaniyah'
    },
    {
      'number': 49,
      'arabic': 'الحجرات',
      'english': 'Al-Hujurat',
      'ayahs': 18,
      'type': 'Madaniyah'
    },
    {
      'number': 50,
      'arabic': 'ق',
      'english': 'Qaf',
      'ayahs': 45,
      'type': 'Makkiyah'
    },
    {
      'number': 51,
      'arabic': 'الذاريات',
      'english': 'Adh-Dhariyat',
      'ayahs': 60,
      'type': 'Makkiyah'
    },
    {
      'number': 52,
      'arabic': 'الطور',
      'english': 'At-Tur',
      'ayahs': 49,
      'type': 'Makkiyah'
    },
    {
      'number': 53,
      'arabic': 'النجم',
      'english': 'An-Najm',
      'ayahs': 62,
      'type': 'Makkiyah'
    },
    {
      'number': 54,
      'arabic': 'القمر',
      'english': 'Al-Qamar',
      'ayahs': 55,
      'type': 'Makkiyah'
    },
    {
      'number': 55,
      'arabic': 'الرحمن',
      'english': 'Ar-Rahman',
      'ayahs': 78,
      'type': 'Madaniyah'
    },
    {
      'number': 56,
      'arabic': 'الواقعة',
      'english': 'Al-Waqia',
      'ayahs': 96,
      'type': 'Makkiyah'
    },
    {
      'number': 57,
      'arabic': 'الحديد',
      'english': 'Al-Hadid',
      'ayahs': 29,
      'type': 'Madaniyah'
    },
    {
      'number': 58,
      'arabic': 'المجادلة',
      'english': 'Al-Mujadila',
      'ayahs': 22,
      'type': 'Madaniyah'
    },
    {
      'number': 59,
      'arabic': 'الحشر',
      'english': 'Al-Hashr',
      'ayahs': 24,
      'type': 'Madaniyah'
    },
    {
      'number': 60,
      'arabic': 'الممتحنة',
      'english': 'Al-Mumtahina',
      'ayahs': 13,
      'type': 'Madaniyah'
    },
    {
      'number': 61,
      'arabic': 'الصف',
      'english': 'As-Saff',
      'ayahs': 14,
      'type': 'Madaniyah'
    },
    {
      'number': 62,
      'arabic': 'الجمعة',
      'english': 'Al-Jumua',
      'ayahs': 11,
      'type': 'Madaniyah'
    },
    {
      'number': 63,
      'arabic': 'المنافقون',
      'english': 'Al-Munafiqun',
      'ayahs': 11,
      'type': 'Madaniyah'
    },
    {
      'number': 64,
      'arabic': 'التغابن',
      'english': 'At-Taghabun',
      'ayahs': 18,
      'type': 'Madaniyah'
    },
    {
      'number': 65,
      'arabic': 'الطلاق',
      'english': 'At-Talaq',
      'ayahs': 12,
      'type': 'Madaniyah'
    },
    {
      'number': 66,
      'arabic': 'التحريم',
      'english': 'At-Tahrim',
      'ayahs': 12,
      'type': 'Madaniyah'
    },
    {
      'number': 67,
      'arabic': 'الملك',
      'english': 'Al-Mulk',
      'ayahs': 30,
      'type': 'Makkiyah'
    },
    {
      'number': 68,
      'arabic': 'القلم',
      'english': 'Al-Qalam',
      'ayahs': 52,
      'type': 'Makkiyah'
    },
    {
      'number': 69,
      'arabic': 'الحاقة',
      'english': 'Al-Haaqqa',
      'ayahs': 52,
      'type': 'Makkiyah'
    },
    {
      'number': 70,
      'arabic': 'المعارج',
      'english': 'Al-Ma\'arij',
      'ayahs': 44,
      'type': 'Makkiyah'
    },
    {
      'number': 71,
      'arabic': 'نوح',
      'english': 'Nuh',
      'ayahs': 28,
      'type': 'Makkiyah'
    },
    {
      'number': 72,
      'arabic': 'الجن',
      'english': 'Al-Jinn',
      'ayahs': 28,
      'type': 'Makkiyah'
    },
    {
      'number': 73,
      'arabic': 'المزمل',
      'english': 'Al-Muzzammil',
      'ayahs': 20,
      'type': 'Makkiyah'
    },
    {
      'number': 74,
      'arabic': 'المدثر',
      'english': 'Al-Muddaththir',
      'ayahs': 56,
      'type': 'Makkiyah'
    },
    {
      'number': 75,
      'arabic': 'القيامة',
      'english': 'Al-Qiyama',
      'ayahs': 40,
      'type': 'Makkiyah'
    },
    {
      'number': 76,
      'arabic': 'الانسان',
      'english': 'Al-Insan',
      'ayahs': 31,
      'type': 'Madaniyah'
    },
    {
      'number': 77,
      'arabic': 'المرسلات',
      'english': 'Al-Mursalat',
      'ayahs': 50,
      'type': 'Makkiyah'
    },
    {
      'number': 78,
      'arabic': 'النبأ',
      'english': 'An-Naba',
      'ayahs': 40,
      'type': 'Makkiyah'
    },
    {
      'number': 79,
      'arabic': 'النازعات',
      'english': 'An-Nazi\'at',
      'ayahs': 46,
      'type': 'Makkiyah'
    },
    {
      'number': 80,
      'arabic': 'عبس',
      'english': 'Abasa',
      'ayahs': 42,
      'type': 'Makkiyah'
    },
    {
      'number': 81,
      'arabic': 'التكوير',
      'english': 'At-Takwir',
      'ayahs': 29,
      'type': 'Makkiyah'
    },
    {
      'number': 82,
      'arabic': 'الإنفطار',
      'english': 'Al-Infitar',
      'ayahs': 19,
      'type': 'Makkiyah'
    },
    {
      'number': 83,
      'arabic': 'المطففين',
      'english': 'Al-Mutaffifin',
      'ayahs': 36,
      'type': 'Makkiyah'
    },
    {
      'number': 84,
      'arabic': 'الإنشقاق',
      'english': 'Al-Inshiqaq',
      'ayahs': 25,
      'type': 'Makkiyah'
    },
    {
      'number': 85,
      'arabic': 'البروج',
      'english': 'Al-Burooj',
      'ayahs': 22,
      'type': 'Makkiyah'
    },
    {
      'number': 86,
      'arabic': 'الطارق',
      'english': 'At-Tariq',
      'ayahs': 17,
      'type': 'Makkiyah'
    },
    {
      'number': 87,
      'arabic': 'الأعلى',
      'english': 'Al-A\'la',
      'ayahs': 19,
      'type': 'Makkiyah'
    },
    {
      'number': 88,
      'arabic': 'الغاشية',
      'english': 'Al-Ghashiya',
      'ayahs': 26,
      'type': 'Makkiyah'
    },
    {
      'number': 89,
      'arabic': 'الفجر',
      'english': 'Al-Fajr',
      'ayahs': 30,
      'type': 'Makkiyah'
    },
    {
      'number': 90,
      'arabic': 'البلد',
      'english': 'Al-Balad',
      'ayahs': 20,
      'type': 'Makkiyah'
    },
    {
      'number': 91,
      'arabic': 'الشمس',
      'english': 'Ash-Shams',
      'ayahs': 15,
      'type': 'Makkiyah'
    },
    {
      'number': 92,
      'arabic': 'الليل',
      'english': 'Al-Lail',
      'ayahs': 21,
      'type': 'Makkiyah'
    },
    {
      'number': 93,
      'arabic': 'الضحى',
      'english': 'Ad-Duha',
      'ayahs': 11,
      'type': 'Makkiyah'
    },
    {
      'number': 94,
      'arabic': 'الشرح',
      'english': 'Ash-Sharh',
      'ayahs': 8,
      'type': 'Makkiyah'
    },
    {
      'number': 95,
      'arabic': 'التين',
      'english': 'At-Tin',
      'ayahs': 8,
      'type': 'Makkiyah'
    },
    {
      'number': 96,
      'arabic': 'العلق',
      'english': 'Al-Alaq',
      'ayahs': 19,
      'type': 'Makkiyah'
    },
    {
      'number': 97,
      'arabic': 'القدر',
      'english': 'Al-Qadr',
      'ayahs': 5,
      'type': 'Makkiyah'
    },
    {
      'number': 98,
      'arabic': 'البينة',
      'english': 'Al-Bayyina',
      'ayahs': 8,
      'type': 'Madaniyah'
    },
    {
      'number': 99,
      'arabic': 'الزلزلة',
      'english': 'Az-Zalzala',
      'ayahs': 8,
      'type': 'Madaniyah'
    },
    {
      'number': 100,
      'arabic': 'العاديات',
      'english': 'Al-Adiyat',
      'ayahs': 11,
      'type': 'Makkiyah'
    },
    {
      'number': 101,
      'arabic': 'القارعة',
      'english': 'Al-Qaria',
      'ayahs': 11,
      'type': 'Makkiyah'
    },
    {
      'number': 102,
      'arabic': 'التكاثر',
      'english': 'At-Takathur',
      'ayahs': 8,
      'type': 'Makkiyah'
    },
    {
      'number': 103,
      'arabic': 'العصر',
      'english': 'Al-Asr',
      'ayahs': 3,
      'type': 'Makkiyah'
    },
    {
      'number': 104,
      'arabic': 'الهمزة',
      'english': 'Al-Humaza',
      'ayahs': 9,
      'type': 'Makkiyah'
    },
    {
      'number': 105,
      'arabic': 'الفيل',
      'english': 'Al-Fil',
      'ayahs': 5,
      'type': 'Makkiyah'
    },
    {
      'number': 106,
      'arabic': 'قريش',
      'english': 'Quraish',
      'ayahs': 4,
      'type': 'Makkiyah'
    },
    {
      'number': 107,
      'arabic': 'الماعون',
      'english': 'Al-Ma\'un',
      'ayahs': 7,
      'type': 'Makkiyah'
    },
    {
      'number': 108,
      'arabic': 'الكوثر',
      'english': 'Al-Kawthar',
      'ayahs': 3,
      'type': 'Makkiyah'
    },
    {
      'number': 109,
      'arabic': 'الكافرون',
      'english': 'Al-Kafiroon',
      'ayahs': 6,
      'type': 'Makkiyah'
    },
    {
      'number': 110,
      'arabic': 'النصر',
      'english': 'An-Nasr',
      'ayahs': 3,
      'type': 'Madaniyah'
    },
    {
      'number': 111,
      'arabic': 'المسد',
      'english': 'Al-Masad',
      'ayahs': 5,
      'type': 'Makkiyah'
    },
    {
      'number': 112,
      'arabic': 'الإخلاص',
      'english': 'Al-Ikhlas',
      'ayahs': 4,
      'type': 'Makkiyah'
    },
    {
      'number': 113,
      'arabic': 'الفلق',
      'english': 'Al-Falaq',
      'ayahs': 5,
      'type': 'Makkiyah'
    },
    {
      'number': 114,
      'arabic': 'الناس',
      'english': 'An-Nas',
      'ayahs': 6,
      'type': 'Makkiyah'
    }
  ];
  static List<String> languages = ['العربية', 'English'];
}
