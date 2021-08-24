part of 'localisation_bloc.dart';

@immutable
abstract class LocalisationState {}

class LocalisationInitial extends LocalisationState {}

class LocalisationLoadedState extends LocalisationState {}

class LocalisationLoadingState extends LocalisationState {}

class LocalisationFailureState extends LocalisationState {}
