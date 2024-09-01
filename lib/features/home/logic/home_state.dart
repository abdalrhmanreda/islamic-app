import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@Freezed()
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = Initial<T>;

  const factory HomeState.loading() = Loading<T>;

  const factory HomeState.loaded(T data) = Loaded<T>;

  const factory HomeState.error(String message) = Error<T>;

  const factory HomeState.findNextPrayer(T data) = FindNextPrayer<T>;

  const factory HomeState.sendNotification() = SendNotification<T>;

  const factory HomeState.loadData() = LoadData<T>;

  const factory HomeState.monthChanged(DateTime newMonth) = MonthChanged<T>;

  const factory HomeState.daySelected(DateTime selectedDay) = DaySelected<T>;

  const factory HomeState.prayerTimeSelected(DateTime selectedTime) =
      PrayerTimeSelected<T>;
}
