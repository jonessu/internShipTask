part of 'sharedpreference_bloc.dart';

@immutable
abstract class SharedpreferenceState {}

class SharedpreferenceInitial extends SharedpreferenceState {}

class SharedpreferenceLoadedState extends SharedpreferenceState {}

class SharedpreferenceLoadingState extends SharedpreferenceState {}

class SharedpreferenceFailureState extends SharedpreferenceState {}
