part of 'storyshare_bloc.dart';

@immutable
abstract class StoryshareState {}

class StoryshareInitial extends StoryshareState {}

class StoryshareLoadedState extends StoryshareState {}

class StoryshareLoadingState extends StoryshareState {}

class StoryshareFailureState extends StoryshareState {}
