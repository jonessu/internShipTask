part of 'customlist_bloc.dart';

@immutable
abstract class CustomlistState {}

class CustomlistInitial extends CustomlistState {}

class CustomlistLoadedState extends CustomlistState {}

class CustomlistLoadingState extends CustomlistState {}

class CustomlistFailureState extends CustomlistState {}
