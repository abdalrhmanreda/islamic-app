// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:path_provider/path_provider.dart';
//
// import '../../../../config/colors/app_colors.dart';
// import '../../../../core/components/progress_indector.dart';
// import '../../logic/radio_cubit.dart';
//
// class VideoItem extends StatelessWidget {
//   const VideoItem({
//     super.key,
//     required this.state,
//   });
//
//   final RadioState state;
//
//   Future<void> downloadVideo(
//       BuildContext context, String videoUrl, int videoId) async {
//     try {
//       // Get the directory for storing the file
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = "${directory.path}/video_$videoId.mp4";
//
//       // Create a Dio instance
//       Dio dio = Dio();
//
//       // Download the video
//       await dio.download(videoUrl, filePath,
//           onReceiveProgress: (received, total) {
//         if (total != -1) {
//           // Print download progress
//           print("${(received / total * 100).toStringAsFixed(0)}%");
//         }
//       });
//
//       // Print the file path
//       print("Video downloaded to: $filePath");
//
//       // Show a success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Download completed: $filePath')),
//       );
//     } catch (e) {
//       // Print the error
//       print("Error downloading video: $e");
//
//       // Show an error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error downloading video: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: context.watch<RadioCubit>().reciters.length,
//       itemBuilder: (context, reciterIndex) {
//         final reciter = context.read<RadioCubit>().videos[reciterIndex];
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               reciter.reciterName,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             ...reciter.videos.map((video) {
//               return GestureDetector(
//                 onTap: () => downloadVideo(context, video.videoUrl, video.id),
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   margin: const EdgeInsets.only(bottom: 20.0),
//                   decoration: BoxDecoration(
//                     color: AppColors.kCircleAvatarColor,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: state is GetVideoLoadingState
//                         ? const CustomLoadingIndicator()
//                         : CachedNetworkImage(
//                             imageUrl: video.videoThumbUrl,
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) => const Center(
//                               child: CircularProgressIndicator(),
//                             ),
//                             errorWidget: (context, url, error) => const Center(
//                               child: Icon(
//                                 Icons.error,
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ],
//         );
//       },
//     );
//   }
// }
