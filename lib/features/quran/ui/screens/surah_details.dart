import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/app_variable.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/model/surah_model.dart';
import '../../logic/surah_details_cubit.dart';
import '../../logic/surah_details_state.dart';
import '../widgets/aya_item.dart';
import '../widgets/container_surah_item.dart';

class SurahDetails extends StatelessWidget {
  const SurahDetails({super.key, required this.surah});

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahDetailsCubit(),
      child: BlocConsumer<SurahDetailsCubit, SurahDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                AppVariable.quranSurahs[surah.index]['arabic'],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ContainerSurahItem(surah: surah),
                  if (surah.index != 0 && surah.index != 8)
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 10.w),
                      child: Text(
                        quran.basmala,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18.sp,
                              fontFamily: 'amiri',
                              fontWeight: FontWeightHelper.regular,
                            ),
                      ),
                    ),
                  Spacing.verticalSpace(10),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    separatorBuilder: (context, index) =>
                        Spacing.verticalSpace(10),
                    itemCount: AppVariable.quranSurahs[surah.index]['ayahs'],
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.kCircleAvatarColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.kLightGreyColor,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 10.w),
                      child: AyaItem(
                        index: index,
                        surahModel: surah,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
