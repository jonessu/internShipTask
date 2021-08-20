part of 'customwidget_bloc.dart';

@immutable
abstract class CustomwidgetState {}

class CustomwidgetInitial extends CustomwidgetState {}

class CustomwidgetLoadedState extends CustomwidgetState {}

class CustomwidgetLoadingState extends CustomwidgetState {}

class CustomwidgetFailureState extends CustomwidgetState {}
