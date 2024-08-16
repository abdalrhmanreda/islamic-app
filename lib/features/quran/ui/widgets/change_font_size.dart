// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:muslim/config/colors/app_colors.dart';
// import 'package:muslim/config/themes/font_weight.dart';
// import 'package:muslim/core/helpers/app_variable.dart';
// import 'package:muslim/core/helpers/spacing.dart';
// import 'package:muslim/features/quran/logic/surah_details_cubit.dart';
//
// class ChangeFontSize extends StatefulWidget {
//   const ChangeFontSize({
//     super.key,
//   });
//
//   @override
//   State<ChangeFontSize> createState() => _ChangeFontSizeState();
// }
//
// class _ChangeFontSizeState extends State<ChangeFontSize> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           AppLocalizations.of(context)!.fontSizes,
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeightHelper.semiBold,
//               ),
//         ),
//         Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 if (AppVariable.currentFontSize >= 16 &&
//                     AppVariable.currentFontSize < 20) {
//                   setState(() {
//                     context
//                         .read<SurahDetailsCubit>()
//                         .changeFontSize(AppVariable.currentFontSize += 2);
//                   });
//                   print(AppVariable.currentFontSize);
//                 }
//               },
//               child: Container(
//                 width: 35.w,
//                 height: 35.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: AppColors.kPrimaryColor,
//                 ),
//                 child: const Icon(
//                   Iconsax.add_outline,
//                   color: AppColors.kWhiteColor,
//                 ),
//               ),
//             ),
//             Spacing.horizontalSpace(10),
//             Text(
//               AppVariable.currentFontSize >= 16 &&
//                       AppVariable.currentFontSize < 18
//                   ? AppLocalizations.of(context)!.small
//                   : AppVariable.currentFontSize >= 18 &&
//                           AppVariable.currentFontSize < 20
//                       ? AppLocalizations.of(context)!.medium
//                       : AppLocalizations.of(context)!.large,
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeightHelper.semiBold,
//                   ),
//             ),
//             Spacing.horizontalSpace(10),
//             GestureDetector(
//               onTap: () {
//                 if (AppVariable.currentFontSize > 16) {
//                   setState(() {
//                     context
//                         .read<SurahDetailsCubit>()
//                         .changeFontSize(AppVariable.currentFontSize -= 2);
//                   });
//                 }
//                 print(AppVariable.currentFontSize);
//               },
//               child: Container(
//                 width: 35.w,
//                 height: 35.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: AppColors.kPrimaryColor,
//                 ),
//                 child: const Icon(
//                   Icons.remove,
//                   color: AppColors.kWhiteColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
