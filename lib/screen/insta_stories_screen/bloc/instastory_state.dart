part of 'instastory_bloc.dart';

@immutable
abstract class InstastoryState {}

class InstastoryInitial extends InstastoryState {}

class InstastoryLoadedState extends InstastoryState {}

class InstastoryLoadingState extends InstastoryState {}

class InstastoryFailureState extends InstastoryState {}
