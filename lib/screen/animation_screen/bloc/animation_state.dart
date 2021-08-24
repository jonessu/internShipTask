part of 'animation_bloc.dart';

@immutable
abstract class AnimationState {}

class AnimationInitial extends AnimationState {}

class AnimationLoadedState extends AnimationState {}

class AnimationLoadingState extends AnimationState {}

class AnimationFailureState extends AnimationState {}
