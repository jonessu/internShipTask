part of 'walkthrough_bloc.dart';

@immutable
abstract class WalkthroughState {}

class WalkthroughInitial extends WalkthroughState {}

class WalkthroughLoadedState extends WalkthroughState {}

class WalkthroughLoadingState extends WalkthroughState {}

class WalkthroughFailureState extends WalkthroughState {}
