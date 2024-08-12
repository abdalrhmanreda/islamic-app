// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:muslim/config/colors/app_colors.dart';
// import 'package:muslim/core/constant/app_constant.dart';
// import 'package:video_player/video_player.dart';
//
// class HomeSliverAppBar extends StatelessWidget {
//   const HomeSliverAppBar({
//     super.key,
//     required VideoPlayerController controller,
//   }) : _controller = controller;
//
//   final VideoPlayerController _controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       automaticallyImplyLeading: false,
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(20),
//         child: Container(
//           height: 20.h,
//           width: AppConstant.deviceWidth(context),
//           decoration: const BoxDecoration(
//             color: AppColors.kScaffoldLightColor,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//         ),
//       ),
//       expandedHeight: AppConstant.deviceHeight(context) / 2.7,
//       floating: false,
//       flexibleSpace: FlexibleSpaceBar(
//         background: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : Container(),
//       ),
//     );
//   }
// }
