// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
//
// void showNoInternetDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         backgroundColor: AppColors.kDarkPrimaryColor,
//         title: Text(
//           AppLocalizations.of(context)!.noInternet,
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                 fontSize: 18.sp,
//               ),
//           textAlign: TextAlign.center,
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset(Assets.noInternetNoInternet,
//                 width: 100.w, height: 100.h),
//             Text(AppLocalizations.of(context)!.noInternetDesc,
//                 style: Theme.of(context).textTheme.bodyMedium),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text(AppLocalizations.of(context)!.ok,
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       color: AppColors.kPrimaryColor,
//                     )),
//           ),
//         ],
//       );
//     },
//   );
// }
