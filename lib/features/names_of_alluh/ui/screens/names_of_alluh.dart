import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/config/colors/app_colors.dart';
import 'package:muslim_app/core/components/custom_app_bar.dart';
import 'package:muslim_app/core/components/custom_sliver_app_bar.dart';
import 'package:muslim_app/core/methods/get_responsive_text/responsive_text.dart';
import 'package:muslim_app/features/home/ui/widgets/feature_item.dart';
import 'package:muslim_app/generated/assets.dart';

import '../../../../config/themes/font_weight.dart';
import '../../../../core/constant/app_constant.dart';
import '../../logic/names_of_alluh_cubit.dart';
import '../../logic/names_of_alluh_state.dart';
import '../widgets/name_of_alluh_item.dart';

class NamesOfAlluh extends StatelessWidget {
  const NamesOfAlluh({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NamesOfAlluhCubit, NamesOfAlluhState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                title: AppLocalizations.of(context)!.namesOfAllah,
                image: Assets.iconsAllah,
                description:
                    AppLocalizations.of(context)!.namesOfAllahDescription,
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        String meaning = context
                            .read<NamesOfAlluhCubit>()
                            .namesOfAlluh[index]
                            .meaning!;
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  backgroundColor: AppColors.kPrimaryColor,
                                  content: Text(
                                    meaning,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: getResponsiveFontSize(
                                              context,
                                              fontSize: 18),
                                          fontWeight: FontWeightHelper.regular,
                                          color: AppColors.kWhiteColor,
                                        ),
                                  ),
                                ));
                      },
                      child: NameOfAlluhItem(
                        title: context
                            .read<NamesOfAlluhCubit>()
                            .namesOfAlluh[index]
                            .nameOfAllah!,
                        image: Assets.iconsAllah,
                      ),
                    );
                  },
                  childCount:
                      context.read<NamesOfAlluhCubit>().namesOfAlluh.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: .91,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
