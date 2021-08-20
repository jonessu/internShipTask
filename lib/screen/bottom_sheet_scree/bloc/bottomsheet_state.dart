part of 'bottomsheet_bloc.dart';

@immutable
abstract class BottomsheetState {}

class BottomsheetInitial extends BottomsheetState {}

class BottomsheetLoadedState extends BottomsheetState {}

class BottomsheetLoadingState extends BottomsheetState {}

class BottomsheetFailureState extends BottomsheetState {}
