import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/font_weight.dart';
import '../../logic/names_of_alluh_cubit.dart';
import '../../logic/names_of_alluh_state.dart';
import '../widgets/back_side.dart';
import '../widgets/front_side.dart';

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
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.namesOfAllah,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeightHelper.regular,
                    ),
              ),
            ),
            body: ListView.builder(
              itemCount: context.read<NamesOfAlluhCubit>().namesOfAlluh.length,
              itemBuilder: (context, index) {
                return FlipCard(
                  fill: Fill.fillBack,
                  // Fill the back side of the card to make in the same size as the front.
                  direction: FlipDirection.HORIZONTAL,
                  // default
                  side: CardSide.FRONT,
                  // The side to initially display.
                  front: FrontSide(
                    index: index,
                  ),
                  back: BackSide(
                    index: index,
                  ),
                );
              },
            ));
      },
    );
  }
}
