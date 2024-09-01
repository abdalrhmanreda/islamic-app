import 'package:freezed_annotation/freezed_annotation.dart';

part 'azkar_state.freezed.dart';

@freezed
class AzkarState<T> with _$AzkarState<T> {
  const factory AzkarState.initial() = Initial<T>;

  const factory AzkarState.loading() = Loading<T>;

  const factory AzkarState.loaded(T data) = Loaded<T>;

  const factory AzkarState.error(String message) = Error<T>;

  const factory AzkarState.copyToClipboard() = CopyToClipboard<T>;

  const factory AzkarState.addToFavorite(T zakerModel) = AddToFavorite<T>;

  const factory AzkarState.removeFromFavorite(T zakerModel) =
      RemoveFromFavorite<T>;

  const factory AzkarState.getFavorite(T data) = GetFavorite<T>;
}
