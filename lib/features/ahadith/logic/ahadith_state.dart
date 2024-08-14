import 'package:freezed_annotation/freezed_annotation.dart';

part 'ahadith_state.freezed.dart';

@Freezed()
class AhadithState<T> with _$AhadithState<T> {
  const factory AhadithState.initial() = Initial<T>;
  const factory AhadithState.loading() = Loading<T>;
  const factory AhadithState.loaded(T data) = Loaded<T>;
  const factory AhadithState.error(String message) = Error<T>;
  const factory AhadithState.getBooks() = GetBooks<T>;
  const factory AhadithState.getImamBooks() = GetImamBooks<T>;
}
