part of 'searchlist_bloc.dart';

@immutable
abstract class SearchlistEvent {}

class SearchlistInitialEvent extends SearchlistEvent {}

class SearchlistChangeEvent extends SearchlistEvent {}
