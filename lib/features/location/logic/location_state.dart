import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_state.freezed.dart';

@Freezed()
class LocationState<T> with _$LocationState<T> {
  const factory LocationState.initial() = Initial<T>;

  const factory LocationState.loading() = Loading<T>;

  const factory LocationState.success(T data) = Success<T>;

  const factory LocationState.error(String message) = Error<T>;
}
