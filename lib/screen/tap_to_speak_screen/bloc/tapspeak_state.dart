part of 'tapspeak_bloc.dart';

@immutable
abstract class TapspeakState {}

class TapspeakInitial extends TapspeakState {}

class TapspeakLoadedState extends TapspeakState {}

class TapspeakLoadingState extends TapspeakState {}

class TapspeakFailureState extends TapspeakState {}
