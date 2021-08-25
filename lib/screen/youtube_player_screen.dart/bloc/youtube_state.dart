part of 'youtube_bloc.dart';

@immutable
abstract class YoutubeState {}

class YoutubeInitial extends YoutubeState {}

class YoutubeLoadedState extends YoutubeState {}

class YoutubeLoadingState extends YoutubeState {}

class YoutubeFailureState extends YoutubeState {}
