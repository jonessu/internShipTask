part of 'searchlist_bloc.dart';

@immutable
abstract class SearchlistState {}

class SearchlistInitial extends SearchlistState {}

class SearchlistLoadedState extends SearchlistState {}

class SearchlistLoadingState extends SearchlistState {}

class SearchlistFailureState extends SearchlistState {}
