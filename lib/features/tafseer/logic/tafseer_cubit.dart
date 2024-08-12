import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/aya_tafseer_model.dart';
import '../data/repo/tafseer_repo.dart';

part 'tafseer_state.dart';

class TafseerCubit extends Cubit<TafseerState> {
  final TafseerRepo _tafseerRepo;
  TafseerCubit(this._tafseerRepo) : super(TafseerInitial());
  void getTafseer(int index) async {
    emit(TafseerLoading());
    final result = await _tafseerRepo.getTafseer(index);
    result.when(
      success: (data) {
        emit(TafseerLoaded(data));
      },
      error: (message) {
        print('Error---------------: $message');
        emit(TafseerError(message));
      },
    );
  }
}
