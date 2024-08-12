import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import '../../logic/radio_cubit.dart';

class SearchReciterPart extends StatelessWidget {
  const SearchReciterPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RadioCubit, RadioState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          height: 50.h,
          margin: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          width: AppConstant.deviceWidth(context),
          decoration: BoxDecoration(
            color: AppColors.kCircleAvatarColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            controller: context.read<RadioCubit>().searchController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchForFavoriteReciter,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.kGreyColor,
                  ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              prefixIcon: const Icon(
                Iconsax.search_normal_outline,
                color: AppColors.kGreyColor,
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                context.read<RadioCubit>().searchReciter(value);
              } else if (value.isEmpty) {
                context.read<RadioCubit>().searchResult = [];
              }
            },
          ),
        );
      },
    );
  }
}
