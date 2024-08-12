import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/custom_divider.dart';
import '../../../../core/components/progress_indector.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/di/dependancy_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/repo/tafseer_repo.dart';
import '../../logic/tafseer_cubit.dart';
import '../widgets/no_internet_widget.dart';
import '../widgets/row_action.dart';

class TafseerDetails extends StatelessWidget {
  const TafseerDetails({super.key, required this.index, required this.surah});

  final int index;
  final String surah;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TafseerCubit(getIt<TafseerRepo>())..getTafseer(index),
      child: BlocConsumer<TafseerCubit, TafseerState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is TafseerError
              ? const NoInternetWidget()
              : Scaffold(
                  appBar: AppBar(
                    title: Text(
                      surah,
                    ),
                  ),
                  body: ConditionalBuilder(
                    condition: state is! TafseerLoading,
                    builder: (context) => ListView.separated(
                      separatorBuilder: (context, index) =>
                          Spacing.verticalSpace(15),
                      itemCount: state is TafseerLoaded
                          ? state.data.result!.length
                          : 0,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kCircleAvatarColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (state as TafseerLoaded)
                                  .data
                                  .result![index]
                                  .arabicText!,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'amiri',
                              ),
                            ),
                            Spacing.verticalSpace(15),
                            myDivider(AppConstant.deviceWidth(context), 1),
                            Spacing.verticalSpace(10),
                            Text(
                              (state).data.result![index].translation!,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'amiri',
                              ),
                            ),
                            Spacing.verticalSpace(10),
                            myDivider(AppConstant.deviceWidth(context), 1),
                            Spacing.verticalSpace(10),
                            RowAction(
                              ayaTafseer: state.data.result![index],
                            ),
                          ],
                        ),
                      ),
                    ),
                    fallback: (context) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomLoadingIndicator(),
                          Text(AppLocalizations.of(context)!
                              .waitingLoadingSurahTafseer)
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
