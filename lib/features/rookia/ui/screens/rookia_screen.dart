import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_divider.dart';
import '../../../../core/constant/app_constant.dart';
import '../widgets/rookia_item.dart';

class RookiaScreen extends StatefulWidget {
  const RookiaScreen({super.key});

  @override
  _RookiaScreenState createState() => _RookiaScreenState();
}

class _RookiaScreenState extends State<RookiaScreen> {
  bool _showQuranicVerses = true;

  List<String> rookieQuran = [
    '«بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ  الحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ  الرَّحْمَنِ الرَّحِيمِ  مَالِكِ يَوْمِ الدِّينِ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ  اهدِنَا الصِّرَاطَ الْمُسْتَقِيمَ  صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلاَ الضَّالِّينَ».',
    '«الم ذَلِكَ الْكِتَابُ لاَ رَيْبَ فِيهِ هُدًى لِّلْمُتَّقِينَ الَّذِينَ يُؤْمِنُونَ بِالْغَيْبِ وَيُقِيمُونَ الصَّلاةَ وَمِمَّا رَزَقْنَاهُمْ يُنفِقُونَ والَّذِينَ يُؤْمِنُونَ بِمَا أُنزِلَ إِلَيْكَ وَمَا أُنزِلَ مِن قَبْلِكَ وَبِالآخِرَةِ هُمْ يُوقِنُونَ أُوْلَـئِكَ عَلَى هُدًى مِّن رَّبِّهِمْ وَأُوْلَـئِكَ هُمُ الْمُفْلِحُونَ» (البقرة: 1-5)',
    '«وإلهكم إلهٌ واحدٌ لاَّ إِلَهَ إِلاَّ هُوَ الرَّحْمَنُ الرَّحِيمُ إِنَّ فِي خَلْقِ السَّمَاوَاتِ وَالأَرْضِ وَاخْتِلاَفِ اللَّيْلِ وَالنَّهَارِ وَالْفُلْكِ الَّتِي تَجْرِي فِي الْبَحْرِ بِمَا يَنفَعُ النَّاسَ وَمَا أَنزَلَ اللّهُ مِنَ السَّمَاء مِن مَّاء فَأَحْيَا بِهِ الأرْضَ بَعْدَ مَوْتِهَا وَبَثَّ فِيهَا مِن كُلِّ دَآبَّةٍ وَتَصْرِيفِ الرِّيَاحِ وَالسَّحَابِ الْمُسَخِّرِ بَيْنَ السَّمَاء وَالأَرْضِ لآيَاتٍ لِّقَوْمٍ يَعْقِلُونَ وَمِنَ النَّاسِ مَن يَتَّخِذُ مِن دُونِ اللّهِ أَندَادًا يُحِبُّونَهُمْ كَحُبِّ اللّهِ وَالَّذِينَ آمَنُواْ أَشَدُّ حُبًّا لِّلّهِ وَلَوْ يَرَى الَّذِينَ ظَلَمُواْ إِذْ يَرَوْنَ الْعَذَابَ أَنَّ الْقُوَّةَ لِلّهِ جَمِيعًا وَأَنَّ اللّهَ شَدِيدُ الْعَذَابِ» (البقرة: 165-163)',
    '«اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَن ذَا الَّذِي يَشْفَعُ عِندَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ*لَا إِكْرَاهَ فِي الدِّينِ ۖ قَد تَّبَيَّنَ الرُّشْدُ مِنَ الْغَيِّ ۚ فَمَن يَكْفُرْ بِالطَّاغُوتِ وَيُؤْمِن بِاللَّهِ فَقَدِ اسْتَمْسَكَ بِالْعُرْوَةِ الْوُثْقَىٰ لَا انفِصَامَ لَهَا ۗ وَاللَّهُ سَمِيعٌ عَلِيمٌ*اللَّهُ وَلِيُّ الَّذِينَ آمَنُوا يُخْرِجُهُم مِّنَ الظُّلُمَاتِ إِلَى النُّورِ ۖ وَالَّذِينَ كَفَرُوا أَوْلِيَاؤُهُمُ الطَّاغُوتُ يُخْرِجُونَهُم مِّنَ النُّورِ إِلَى الظُّلُمَاتِ ۗ أُولَٰئِكَ أَصْحَابُ النَّارِ ۖ هُمْ فِيهَا خَالِدُونَ» (البقرة: 257-255)',
    '«لِّلَّهِ ما فِي السَّمَاواتِ وَمَا فِي الأَرْضِ وَإِن تُبْدُواْ مَا فِي أَنفُسِكُمْ أَوْ تُخْفُوهُ يُحَاسِبْكُم بِهِ اللّهُ فَيَغْفِرُ لِمَن يَشَاء وَيُعَذِّبُ مَن يَشَاء وَاللّهُ عَلَى كُلِّ شَيْءٍ قَدِيرٌ آمَنَ الرَّسُولُ بِمَا أُنزِلَ إِلَيْهِ مِن رَّبِّهِ وَالْمُؤْمِنُونَ كُلٌّ آمَنَ بِاللّهِ وَمَلآئِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لاَ نُفَرِّقُ بَيْنَ أَحَدٍ مِّن رُّسُلِهِ وَقَالُواْ سَمِعْنَا وَأَطَعْنَا غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ لاَ يُكَلِّفُ اللّهُ نَفْسًا إِلاَّ وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لاَ تُؤَاخِذْنَا إِن نَّسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلاَ تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِن قَبْلِنَا رَبَّنَا وَلاَ تُحَمِّلْنَا مَا لاَ طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَآ أَنتَ مَوْلاَنَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ» (البقرة: 286-284)',
    '«الم اللّهُ لا إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ نَزَّلَ عَلَيْكَ الْكِتَابَ بِالْحَقِّ مُصَدِّقًا لِّمَا بَيْنَ يَدَيْهِ وَأَنزَلَ التَّوْرَاةَ وَالإِنجِيلَ مِن قَبْلُ هُدًى لِّلنَّاسِ وَأَنزَلَ الْفُرْقَانَ إِنَّ الَّذِينَ كَفَرُواْ بِآيَاتِ اللّهِ لَهُمْ عَذَابٌ شَدِيدٌ وَاللّهُ عَزِيزٌ ذُو انتِقَام إِنَّ اللّهَ لاَ يَخْفَىَ عَلَيْهِ شَيْءٌ فِي الأَرْضِ وَلاَ فِي السَّمَاء» (آل عمران: 5-1)',
    '«قل اللهمَّ مَالِكَ الْمُلْكِ تُؤْتِي الْمُلْكَ مَن تَشَاء وَتَنزِعُ الْمُلْكَ مِمَّن تَشَاء وَتُعِزُّ مَن تَشَاء وَتُذِلُّ مَن تَشَاء بِيَدِكَ الْخَيْرُ إِنَّكَ عَلَىَ كُلِّ شَيْءٍ قَدِيرٌ تُولِجُ اللَّيْلَ فِي الْنَّهَارِ وَتُولِجُ النَّهَارَ فِي اللَّيْلِ وَتُخْرِجُ الْحَيَّ مِنَ الْمَيِّتِ وَتُخْرِجُ الَمَيَّتَ مِنَ الْحَيِّ وَتَرْزُقُ مَن تَشَاء بِغَيْرِ حِسَابٍ لَّا يَتَّخِذِ الْمُؤْمِنُونَ الْكَافِرِينَ أَوْلِيَآءَ مِن دُونِ الْمُؤْمِنِينَ وَمَن يَفْعِلْ ذَلِكَ فَلَيْسَ مِنَ اللهِ فِي شَيْءٍ إِلَّآ أَن تَتَّقُواْ مِنهُم تُقَاةً وَيُحَذِّرُكُمُ اللهُ نَفْسَهُ وُإِلَى اللهِ الْمَصِيرُ» (آل عمران: 28-26)',
    '«إِنَّ رَبَّكُمُ اللّهُ الَّذِي خَلَقَ السَّمَاوَاتِ وَالأَرْضَ فِي سِتَّةِ أَيَّامٍ ثُمَّ اسْتَوَى عَلَى الْعَرْشِ يُغْشِي اللَّيْلَ النَّهَارَ يَطْلُبُهُ حَثِيثًا وَالشَّمْسَ وَالْقَمَرَ وَالنُّجُومَ مُسَخَّرَاتٍ بِأَمْرِهِ أَلاَ لَهُ الْخَلْقُ وَالأَمْرُ تَبَارَكَ اللّهُ رَبُّ الْعَالَمِينَ*ادْعُواْ رَبَّكُمْ تَضَرُّعًا وَخُفْيَةً إِنَّهُ لاَ يُحِبُّ الْمُعْتَدِينَ وَلاَ تُفْسِدُواْ فِي الأَرْضِ بَعْدَ إِصْلاَحِهَا وَادْعُوهُ خَوْفًا وَطَمَعًا إِنَّ رَحْمَتَ اللّهِ قَرِيبٌ مِّنَ الْمُحْسِنِينَ» (الأعراف: 56-54)',
    '«يأَيُّهَا النَّاسُ قَدْ جاءَتْكُمْ مَوْعِظَةٌ مِنْ رَبِّكُمْ وَشِفاءٌ لِما فِي الصُّدُورِ وَهُدىً وَرَحْمَةٌ لِلْمُؤْمِنِينَ*قُلْ بِفَضْلِ اللَّهِ وَبِرَحْمَتِهِ فَبِذلِكَ فَلْيَفْرَحُوا هُوَ خَيْرٌ مِمَّا يَجْمَعُونَ» (يونس: 58-57)',
    '«ثُمَّ كُلِي مِنْ كُلِّ الثَّمَراتِ فَاسْلُكِي سُبُلَ رَبِّكِ ذُلُلًا يَخْرُجُ مِنْ بُطُونِها شَرابٌ مُخْتَلِفٌ أَلْوانُهُ فِيهِ شِفاء لِلنَّاسِ إِنَّ فِي ذلِكَ لَآيَةً لِقَوْمٍ يَتَفَكَّرُونَ» (النحل: 69)',
    '«وَنُنَزِّلُ مِنَ الْقُرْآنِ ما هُوَ شِفاءٌ وَرَحْمَةٌ لِلْمُؤْمِنِينَ وَلا يَزِيدُ الظَّالِمِينَ إِلاَّ خَسارًا» (الإسراء: 82)',
  ];
  final List<String> ruqyahVerses = [
    "بسم الله أرقيك، من كل شيءٍ يؤذيك، من شرّ كلّ نفسٍ أو عين حاسدٍ الله يشفيك، بسم الله أرقيك.",
    "بسم الله الذي لا يضر مع اسمه شيءٌ في الأرض ولا في السماء وهو السميع العليم؛ ثلاث مراتٍ.",
    "بسم الله يبْريك، ومن كل داءٍ يشفيك، ومن شرّ حاسدٍ إذا حسد، وشرّ كلّ ذي عينٍ.",
    "بسم الله (ثلاثًا) أعوذ بالله وقدرته من شرّ ما أجد وأحاذر؛ سبع مراتٍ.",
    "أذهب البأس رب الناس، واشف أنت الشافي لا شفاء إلا شفاؤك شفاءً لا يغادر سقمًا.",
    "أعوذ بكلمات الله التامّة من كلّ شيطانٍ وهامّةٍ وكلّ عينٍ لامةٍ.",
    "أعوذ بكلمات الله التامّات من شرّ ما خلق. أسأل الله العظيم ربّ العرش العظيم أن يشفيك؛ سبع مرّاتٍ.",
    "اللهم صلِ على محمد وعلى آل محمد كما صليت على إبراهيم وعلى آل إبراهيم، إنك حميدٌ مجيدٌ، اللهم بارك على محمد وعلى آل محمد كما باركت على إبراهيم وعلى آل إبراهيم في العالمين إنك حميدٌ مجيدٌ."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.rookie,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ToggleSwitch(
            minWidth: AppConstant.deviceWidth(context) * .8,
            cornerRadius: 20.0,
            radiusStyle: true,
            activeBgColor: const [
              AppColors.kPrimaryColor,
              AppColors.kGreenColor
            ],
            initialLabelIndex: _showQuranicVerses ? 0 : 1,
            activeFgColor: Colors.white,
            inactiveBgColor: AppColors.kCircleAvatarColor,
            inactiveFgColor: AppColors.kPrimaryColor,
            labels: [
              AppLocalizations.of(context)!.ayat,
              AppLocalizations.of(context)!.wardPraise,
            ],
            onToggle: (index) {
              setState(() {
                _showQuranicVerses = index == 0;
              });
            },
          ),
          SizedBox(height: 15.h), // Use ScreenUtil for spacing
          Expanded(
            child: ListView.builder(
              itemCount:
                  _showQuranicVerses ? rookieQuran.length : ruqyahVerses.length,
              itemBuilder: (context, index) {
                return RookiaItem(
                  rookieQuran: _showQuranicVerses
                      ? rookieQuran[index]
                      : ruqyahVerses[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
