part of 'radio_cubit.dart';

@immutable
sealed class RadioState {}

final class RadioInitial extends RadioState {}

final class RadioLoading extends RadioState {}

final class RadioLoaded extends RadioState {}

final class RadioError extends RadioState {
  final String message;

  RadioError(this.message);
}

final class ToggleState extends RadioState {}

final class GetRadioState extends RadioState {}

final class SearchReciterState extends RadioState {
  final List<Reciter> searchResult;

  SearchReciterState(this.searchResult);
}

class NoSearchResultsState extends RadioState {}

final class GetVideoLoadingState extends RadioState {}

final class GetVideoLoadedState extends RadioState {
  final List<ReciterModel> videos;

  GetVideoLoadedState({required this.videos});
}

final class GetVideoErrorState extends RadioState {
  final String message;

  GetVideoErrorState(this.message);
}
