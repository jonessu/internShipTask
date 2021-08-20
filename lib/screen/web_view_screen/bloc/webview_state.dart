part of 'webview_bloc.dart';

@immutable
abstract class WebviewState {}

class WebviewInitial extends WebviewState {}

class WebviewLoadedState extends WebviewState {}

class WebviewLoadingState extends WebviewState {}

class WebviewFailureState extends WebviewState {}
