import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

import '../../../generated/assets.dart';
import '../data/models/name_model.dart';
import 'names_of_alluh_state.dart';

class NamesOfAlluhCubit extends Cubit<NamesOfAlluhState> {
  NamesOfAlluhCubit() : super(const NamesOfAlluhState.initial());

  List<NameModel> namesOfAlluh = [];
  void getNamesOfAlluh() {
    emit(const NamesOfAlluhState.loading());
    rootBundle.loadString(Assets.dataNamesOfAlluh).then((value) {
      var data = jsonDecode(value);
      data['namesOfAlluh'].forEach((element) {
        namesOfAlluh.add(NameModel.fromJson(element));
      });
      emit(NamesOfAlluhState.loaded(value));
    }).catchError((error) {
      emit(NamesOfAlluhState.error(error.toString()));
    });
  }
}
