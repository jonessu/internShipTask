part of 'loginform_bloc.dart';

@immutable
abstract class LoginformEvent {}

class LoginformInitialEvent extends LoginformEvent {}

class LoginformClickEvent extends LoginformEvent {}
