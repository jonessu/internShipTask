part of 'lottieview_bloc.dart';

@immutable
abstract class LottieviewState {}

class LottieviewInitial extends LottieviewState {}

class LottieviewLoadedState extends LottieviewState {}

class LottieviewLoadingState extends LottieviewState {}

class LottieviewFailureState extends LottieviewState {}
