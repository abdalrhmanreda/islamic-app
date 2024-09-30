import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../config/colors/app_colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/reciter_model.dart';

class ReciterListView extends StatefulWidget {
  final List<Reciter> reciters;

  const ReciterListView({
    Key? key,
    required this.reciters,
  }) : super(key: key);

  @override
  _ReciterListViewState createState() => _ReciterListViewState();
}

class _ReciterListViewState extends State<ReciterListView> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentlyPlayingIndex;
  bool _isPlaying = false;
  bool _isMounted = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _isMounted = false;
    super.dispose();
  }

  void _playAudio(int index, String url, Function setStateBottomSheet) async {
    try {
      // تعيين حالة التحميل إلى true قبل بدء التحميل
      setStateBottomSheet(() {
        _isLoading = true;
      });

      // تحميل الملف الصوتي
      await _audioPlayer.setUrl(url);

      // بدء التشغيل
      _audioPlayer.play();

      if (_isMounted) {
        setStateBottomSheet(() {
          _currentlyPlayingIndex = index;
          _isPlaying = true;
          _isLoading = false; // تعيين حالة التحميل إلى false بعد بدء التشغيل
        });
      }
    } catch (e) {
      setStateBottomSheet(() {
        _isLoading = false; // تعيين حالة التحميل إلى false عند حدوث خطأ
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(AppLocalizations.of(context)!.errorHappened),
          content: Text(AppLocalizations.of(context)!.enSureInternetConnection),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        ),
      );
    }
  }

  void _stopAudio(Function setStateBottomSheet) async {
    await _audioPlayer.stop();
    if (_isMounted) {
      setStateBottomSheet(() {
        _isPlaying = false;
        _currentlyPlayingIndex = null;
        _isLoading = false; // تعيين حالة التحميل إلى false عند التوقف
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Spacing.verticalSpace(15),
      itemCount: widget.reciters.length,
      itemBuilder: (context, index) {
        final reciter = widget.reciters[index];
        final surahIndices = reciter.moshaf[0].surahList;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(reciter.name),
            subtitle: Text(reciter.moshaf[0].name),
            trailing: const Icon(
              Iconsax.book_1_outline,
              color: AppColors.kPrimaryColor,
            ),
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setStateBottomSheet) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          child: Column(
                            children: [
                              Text(
                                '${AppLocalizations.of(context)!.availableSurahsFor} ${reciter.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 18.sp,
                                    ),
                              ),
                              Spacing.verticalSpace(20),
                              Expanded(
                                child: ListView.separated(
                                  itemBuilder: (context, surahIndex) {
                                    final surah = reciter.moshaf[0];
                                    final surahIndexFormatted =
                                        surahIndices[surahIndex]
                                            .toString()
                                            .padLeft(3, '0');
                                    return buildBottomSheetItem(
                                      surahIndices,
                                      surahIndex,
                                      context,
                                      surah,
                                      surahIndexFormatted,
                                      setStateBottomSheet,
                                    );
                                  },
                                  itemCount: surahIndices.length,
                                  separatorBuilder: (context, index) =>
                                      Spacing.verticalSpace(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Column buildBottomSheetItem(
      List<int> surahIndices,
      int surahIndex,
      BuildContext context,
      Moshaf surah,
      String surahIndexFormatted,
      StateSetter setStateBottomSheet) {
    return Column(
      children: [
        ListTile(
          title: Text(quran.getSurahNameArabic(surahIndices[surahIndex])),
          subtitle: Text(
              '${quran.getVerseCount(surahIndices[surahIndex])} ${AppLocalizations.of(context)!.theNumberOfItsVerses}'),
          trailing: IconButton(
            icon: _isLoading &&
                    _currentlyPlayingIndex == surahIndices[surahIndex]
                ? SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: const CircularProgressIndicator(),
                  )
                : Icon(
                    _isPlaying &&
                            _currentlyPlayingIndex == surahIndices[surahIndex]
                        ? Iconsax.pause_outline
                        : Iconsax.play_outline,
                  ),
            onPressed: () {
              _isPlaying && _currentlyPlayingIndex == surahIndices[surahIndex]
                  ? _stopAudio(setStateBottomSheet)
                  : _playAudio(
                      surahIndices[surahIndex],
                      '${surah.server}$surahIndexFormatted.mp3',
                      setStateBottomSheet,
                    );
            },
          ),
        ),
        if (_isPlaying && _currentlyPlayingIndex == surahIndices[surahIndex])
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 15.w,
            ),
            child: Column(
              children: [
                StreamBuilder<Duration>(
                  stream: _audioPlayer.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    return ProgressBar(
                      progress: position,
                      total: _audioPlayer.duration ?? Duration.zero,
                      onSeek: (duration) {
                        _audioPlayer.seek(duration);
                      },
                    );
                  },
                ),
                StreamBuilder<PlayerState>(
                  stream: _audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing ?? false;

                    if (processingState == ProcessingState.buffering ||
                        processingState == ProcessingState.loading) {
                      return const CircularProgressIndicator();
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
