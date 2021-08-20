part of 'selection_bloc.dart';

@immutable
abstract class SelectionState {}

class SelectionInitial extends SelectionState {}

class SelectionLoadedState extends SelectionState {}

class SelectionLoadingState extends SelectionState {}

class SelectionFailureState extends SelectionState {}
