import 'package:flutter/material.dart';
import 'package:jhijri/jHijri.dart';
import 'package:muslim_app/core/helpers/spacing.dart';

import '../../data/hiji_model.dart';
import '../widgets/calendar_sliver_app_bar.dart';
import '../widgets/custom_expandable.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HijriEvent> hijriEvents = [
      HijriEvent(
        name: 'رأس السنة الهجرية',
        description:
            'يحتفل المسلمون ببداية سنة هجرية جديدة، وهو اليوم الذي هاجر فيه النبي محمد (صلى الله عليه وسلم) من مكة إلى المدينة.',
        date: '1 محرم',
        monthNumber: 1,
      ),
      HijriEvent(
        name: 'عاشوراء',
        description:
            'اليوم العاشر من محرم، وهو يوم نجى فيه الله موسى وقومه من فرعون. يصوم فيه المسلمون استحباباً.',
        date: '10 محرم',
        monthNumber: 1,
      ),
      HijriEvent(
        name: 'المولد النبوي',
        description:
            'يُحتفل بمولد النبي محمد (صلى الله عليه وسلم) في 12 ربيع الأول من كل عام هجري.',
        date: '12 ربيع الأول',
        monthNumber: 3,
      ),
      HijriEvent(
        name: 'الإسراء والمعراج',
        description:
            'ذكرى رحلة الإسراء والمعراج التي عرج فيها النبي محمد (صلى الله عليه وسلم) إلى السماوات السبع.',
        date: '27 رجب',
        monthNumber: 7,
      ),
      HijriEvent(
        name: 'النصف من شعبان',
        description:
            'يُعتقد أن الله يغفر فيه الذنوب ويكتب الآجال، ويستحب فيه الصيام والدعاء.',
        date: '15 شعبان',
        monthNumber: 8,
      ),
      HijriEvent(
        name: 'بداية رمضان',
        description: 'بداية شهر الصيام والعبادة والتقرب إلى الله.',
        date: '1 رمضان',
        monthNumber: 9,
      ),
      HijriEvent(
        name: 'ليلة القدر',
        description:
            'ليلة القدر هي ليلة عظيمة تنزل فيها الملائكة ويغفر الله فيها الذنوب، وتكون في العشر الأواخر من رمضان.',
        date:
            '27 رمضان', // يمكن تغيير التاريخ بناءً على تحديد ليلة القدر في كل عام
        monthNumber: 9,
      ),
      HijriEvent(
        name: 'عيد الفطر',
        description:
            'يأتي بعد انتهاء شهر رمضان المبارك وهو يوم فرح وسرور وصلة رحم.',
        date: '1 شوال',
        monthNumber: 10,
      ),
      HijriEvent(
        name: 'يوم عرفة',
        description:
            'اليوم التاسع من ذي الحجة، وهو يوم الوقوف على جبل عرفة للحجاج، ويستحب فيه الصيام لغير الحاج.',
        date: '9 ذو الحجة',
        monthNumber: 12,
      ),
      HijriEvent(
        name: 'عيد الأضحى',
        description:
            'يحتفل فيه المسلمون بعد انتهاء مناسك الحج ويقومون بذبح الأضاحي.',
        date: '10 ذو الحجة',
        monthNumber: 12,
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CalendarSliverAppBar(),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final HijriEvent hijriEvent = hijriEvents[index];

              // Extract the day, month, and year from the HijriEvent
              final parts = hijriEvent.date.split(' ');
              final day = int.parse(parts[0]);
              final month = hijriMonthNameToNumber(parts[1]);
              final year =
                  HijriDate.now().year; // Example: Adjust this as needed

              final jHijri = JHijri(fMonth: month, fYear: year, fDay: day);
              final gregorianDate = jHijri.dateTime;

              return CustomExpandable(
                title: hijriEvent.name,
                content: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hijriEvent.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Spacing.verticalSpace(5),
                      Text(
                        'التاريخ: ${hijriEvent.date} (${gregorianDate.year}-${gregorianDate.month}-${gregorianDate.day})',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: hijriEvents.length,
          )),
        ],
      ),
    );
  }

  int hijriMonthNameToNumber(String monthName) {
    switch (monthName) {
      case 'محرم':
        return 1;
      case 'صفر':
        return 2;
      case 'ربيع الأول':
        return 3;
      case 'ربيع الآخر':
        return 4;
      case 'جمادى الأولى':
        return 5;
      case 'جمادى الآخرة':
        return 6;
      case 'رجب':
        return 7;
      case 'شعبان':
        return 8;
      case 'رمضان':
        return 9;
      case 'شوال':
        return 10;
      case 'ذو القعدة':
        return 11;
      case 'ذو الحجة':
        return 12;
      default:
        return 1; // Default case for unknown month names
    }
  }
}
