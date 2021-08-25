part of 'emailcall_bloc.dart';

@immutable
abstract class EmailcallState {}

class EmailcallInitial extends EmailcallState {}

class EmailcallLoadedState extends EmailcallState {}

class EmailcallLoadingState extends EmailcallState {}

class EmailcallFailureState extends EmailcallState {}
