part of 'loginform_bloc.dart';

@immutable
abstract class LoginformState {}

class LoginformInitial extends LoginformState {}

class LoginformLoadedState extends LoginformState {}

class LoginformLoadingState extends LoginformState {}

class LoginformFailureState extends LoginformState {}

class LoginformNavigationState extends LoginformState {}
