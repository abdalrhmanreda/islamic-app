import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayers_state.freezed.dart';

@freezed
class PrayersState<T> with _$PrayersState<T> {
  const factory PrayersState.initial() = Initial<T>;

  const factory PrayersState.loading() = Loading<T>;

  const factory PrayersState.loaded(T data) = Loaded<T>;

  const factory PrayersState.error(String message) = Error<T>;

  const factory PrayersState.addToFavorite() = AddToFavorite<T>;

  const factory PrayersState.removeFromFavorite() = RemoveFromFavorite<T>;

  const factory PrayersState.favoriteList(List<T> data) = FavoriteList<T>;
}
