import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasbeeh_state.freezed.dart';

@Freezed()
class TasbeehState<T> with _$TasbeehState<T> {
  const factory TasbeehState.initial() = TasbeehInitial<T>;
  const factory TasbeehState.loading() = TasbeehLoading<T>;
  const factory TasbeehState.loaded(T data) = TasbeehLoaded<T>;
  const factory TasbeehState.error(String message) = TasbeehError<T>;
}
