import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/progress_indector.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/tasbeeh_cubit.dart';
import '../../logic/tasbeeh_state.dart';
import '../widgets/tasbeeh_buttons.dart';
import '../widgets/tasbeeh_item.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.tabeehButtonIncrease,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
        ),
      ),
      body: BlocConsumer<TasbeehCubit, TasbeehState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is TasbeehLoading
              ? const CustomLoadingIndicator()
              : Column(
                  children: [
                    SizedBox(
                      height: 260.h,
                      child: PageView.builder(
                          controller:
                              context.watch<TasbeehCubit>().pageController,
                          itemCount: context
                              .watch<TasbeehCubit>()
                              .generalTasbeeh
                              .length,
                          itemBuilder: (context, index) {
                            final tasbeeh = context
                                .watch<TasbeehCubit>()
                                .generalTasbeeh[index];
                            return TasbeehItem(
                              tasbeeh: tasbeeh.content,
                              count: tasbeeh.count,
                              description: tasbeeh.description,
                            );
                          },
                          onPageChanged: (index) {
                            context
                                .read<TasbeehCubit>()
                                .pageController
                                .jumpToPage(
                                  index,
                                );
                            context.read<TasbeehCubit>().decreaseCount();
                          }),
                    ),
                    Spacing.verticalSpace(25),
                    TasbeehButtons(
                      pageController:
                          context.read<TasbeehCubit>().pageController,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
