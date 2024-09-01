part of 'tafseer_cubit.dart';

@immutable
sealed class TafseerState {}

final class TafseerInitial extends TafseerState {}

final class TafseerLoading extends TafseerState {}

final class TafseerLoaded extends TafseerState {
  final TafseerModel data;

  TafseerLoaded(this.data);
}

final class TafseerError extends TafseerState {
  final String message;

  TafseerError(this.message);
}
