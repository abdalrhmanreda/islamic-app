import 'package:freezed_annotation/freezed_annotation.dart';

part 'names_of_alluh_state.freezed.dart';

@Freezed()
class NamesOfAlluhState<T> with _$NamesOfAlluhState<T> {
  const factory NamesOfAlluhState.initial() = Initial<T>;
  const factory NamesOfAlluhState.loading() = Loading<T>;
  const factory NamesOfAlluhState.loaded(T data) = Loaded<T>;
  const factory NamesOfAlluhState.error(String message) = Error<T>;
}
