part of 'prayer_cubit.dart';

@immutable
sealed class PrayerState {}

final class PrayerInitial extends PrayerState {}

class PrayerLoading extends PrayerState {}

class PrayerLoaded extends PrayerState {
  final PrayerTimes prayerModel;

  PrayerLoaded(this.prayerModel);
}

class PrayerError extends PrayerState {
  final String error;

  PrayerError(this.error);
}

class DaySeleceted extends PrayerState {
  final DateTime date;

  DaySeleceted(this.date);
}
