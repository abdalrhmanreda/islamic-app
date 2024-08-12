import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/features/tasbeeh/logic/tasbeeh_state.dart';

import '../../../generated/assets.dart';
import '../data/model/tasbeeh_model.dart';

class TasbeehCubit extends Cubit<TasbeehState> {
  TasbeehCubit() : super(const TasbeehState.initial());
  List<TasbeehModel> generalTasbeeh = [];
  List<int> prayTasbeeh = [];
  PageController pageController = PageController();

  void getTasbeeh() {
    emit(const TasbeehState.loading());
    rootBundle.loadString(Assets.tasbeehTabeeh).then((value) {
      var tasbeeh = jsonDecode(value);
      tasbeeh['تسابيح'].forEach((element) {
        generalTasbeeh.add(TasbeehModel.fromJson(element));
      });
      emit(TasbeehState.loaded(value));
    });
  }

  int count = 0;
  void increaseCount() {
    count++;
    emit(TasbeehState.loaded(count));
  }

  void decreaseCount() {
    count = 0;
    emit(TasbeehState.loaded(count));
  }
}
