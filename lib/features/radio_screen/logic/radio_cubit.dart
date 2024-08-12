import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../generated/assets.dart';
import '../data/models/radio_mode.dart';
import '../data/models/reciter_model.dart';
import '../data/models/video_model.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());

  List<Reciter> reciters = [];
  List<Reciter> searchResult = [];
  int? currentlyPlayingIndex;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration? currentDuration;
  Duration? totalDuration;
  List<RadioModel> radois = [];

  void getReciters() {
    emit(RadioLoading());
    rootBundle.loadString(Assets.dataReciters).then((value) {
      var data = jsonDecode(value);
      var reciterDataList = data['reciters'] as List<dynamic>;
      reciters = reciterDataList.map((e) => Reciter.fromJson(e)).toList();
      rootBundle.loadString(Assets.dataRadio).then((value) {
        jsonDecode(value)['radios'].forEach((element) {
          radois.add(RadioModel.fromJson(element));
        });
        emit(GetRadioState());
      }).catchError((error) {});

      emit(RadioLoaded());
    }).catchError((e) {
      print(e.toString());
      emit(RadioError(e.toString()));
    });
  }

  int currentIndex = 0;
  void toggleIndex(int index) {
    currentIndex = index;
    emit(ToggleState());
  }

  var searchController = TextEditingController();
  void searchReciter(String query) {
    try {
      query = query.toLowerCase().trim();
      searchResult = reciters.where((element) {
        return element.name.toLowerCase().contains(query) ||
            element.id.toString().contains(query);
      }).toList();

      if (searchResult.isEmpty) {
        emit(NoSearchResultsState());
      } else {
        emit(SearchReciterState(searchResult));
      }
    } catch (e) {
      print(e.toString());
      emit(RadioError(e.toString()));
    }
  }
  //
  // List<ReciterModel> videos = [];
  // void getVideos() {
  //   emit(GetVideoLoadingState());
  //   rootBundle.loadString(Assets.dataVideos).then((value) {
  //     var data = jsonDecode(value);
  //     var reciterDataList = data['videos'] as List<dynamic>;
  //     videos = reciterDataList.map((e) => ReciterModel.fromJson(e)).toList();
  //     emit(GetVideoLoadedState(videos: videos));
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(GetVideoErrorState(e.toString()));
  //   });
  // }
}
