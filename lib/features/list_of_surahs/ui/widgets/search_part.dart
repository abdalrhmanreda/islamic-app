// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:muslim/config/colors/app_colors.dart';
// import 'package:muslim/core/constant/app_constant.dart';
//
// class SearchPart extends StatelessWidget {
//   const SearchPart({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ListOfSurahsCubit, ListOfSurahsState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Container(
//           margin: EdgeInsets.only(
//             top: 20.h,
//             bottom: 10.h,
//             right: 15.w,
//             left: 20.w,
//           ),
//           height: 50.h,
//           width: AppConstant.deviceWidth(context),
//           decoration: BoxDecoration(
//             color: AppColors.kWhiteColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: TextFormField(
//             controller: context.read<ListOfSurahsCubit>().searchController,
//             decoration: InputDecoration(
//               hintText: AppLocalizations.of(context)!.searchBySurahAndNumber,
//               hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontSize: 16.sp,
//                     color: AppColors.kGreyColor,
//                   ),
//               prefixIcon: const Icon(Iconsax.search_normal_outline),
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 20.w,
//                 vertical: 10.h,
//               ),
//               border: InputBorder.none,
//             ),
//             onChanged: (value) {
//               context.read<ListOfSurahsCubit>().searchBySurahNameOrNumber(
//                     searchValue: value,
//                   );
//               value.isEmpty
//                   ? context.read<ListOfSurahsCubit>().searchResults.clear()
//                   : null;
//             },
//           ),
//         );
//       },
//     );
//   }
// }
