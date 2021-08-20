part of 'listdetails_bloc.dart';

@immutable
abstract class ListdetailsState {}

class ListdetailsInitial extends ListdetailsState {}

class ListdetailsLoadedState extends ListdetailsState {}

class ListdetailsLoadingState extends ListdetailsState {}

class ListdetailsFailureState extends ListdetailsState {}
