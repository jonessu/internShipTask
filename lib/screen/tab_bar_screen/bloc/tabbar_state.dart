part of 'tabbar_bloc.dart';

@immutable
abstract class TabbarState {}

class TabbarInitial extends TabbarState {}

class TabbarLoadedState extends TabbarState {}

class TabbarLoadingState extends TabbarState {}

class TabbarFailureState extends TabbarState {}
