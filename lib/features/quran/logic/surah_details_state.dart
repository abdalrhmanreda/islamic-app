abstract class SurahDetailsState {}

class Initial extends SurahDetailsState {}

class Loading extends SurahDetailsState {}

class Loaded extends SurahDetailsState {
  dynamic data;
  Loaded(this.data);
}

class Error extends SurahDetailsState {
  final String message;
  Error(this.message);
}

class SurahDetailsLoaded extends SurahDetailsState {
  final bool data;
  SurahDetailsLoaded(this.data);
}

class ChangeCurrentIndex extends SurahDetailsState {
  final int index;
  ChangeCurrentIndex(this.index);
}

class ChangeReciter extends SurahDetailsState {
  dynamic data;
  ChangeReciter(this.data);
}

class ChangeTranslation extends SurahDetailsState {
  dynamic data;
  ChangeTranslation(this.data);
}

class ChangeFontSize extends SurahDetailsState {
  dynamic data;
  ChangeFontSize(this.data);
}

class ChangeFontFamily extends SurahDetailsState {
  dynamic data;
  ChangeFontFamily(this.data);
}

class GetSuraFavoriteStatus extends SurahDetailsState {
  dynamic data;
  GetSuraFavoriteStatus(this.data);
}

// @freezed
// class SurahDetailsState with _$SurahDetailsState {
//   factory SurahDetailsState.initial() = Initial;
//   factory SurahDetailsState.loading() = Loading<T>;
//   factory SurahDetailsState.loaded(T data) = Loaded<T>;
//   factory SurahDetailsState.error(String message) = Error<T>;
//   factory SurahDetailsState.surahDetailsLoaded(bool data) =
//       SurahDetailsLoaded<T>;
//   factory SurahDetailsState.changeCurrentIndex(int index) =
//       ChangeCurrentIndex<T>;
//   factory SurahDetailsState.changeReciter(T data) = ChangeReciter<T>;
//   factory SurahDetailsState.changeTranslation(T data) = ChangeTranslation<T>;
//   factory SurahDetailsState.changeFontSize(T data) = ChangeFontSize<T>;
//   factory SurahDetailsState.changeFontFamily(T data) = ChangeFontFamily<T>;
//   factory SurahDetailsState.addSurahToFavorite(T data) = AddSurahToFavorite<T>;
//   factory SurahDetailsState.getSuraFavoriteStatus(T data) =
//       GetSuraFavoriteStatus<T>;
//   factory SurahDetailsState.removeSurahFromFavorite(T data) =
//       RemoveSurahFromFavorite<T>;
//
// }
