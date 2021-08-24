import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animation_event.dart';
part 'animation_state.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
  AnimationBloc() : super(AnimationInitial());

  @override
  Stream<AnimationState> mapEventToState(
    AnimationEvent event,
  ) async* {
    if (event is AnimationInitialEvent) {
      yield AnimationLoadedState();
    }
  }
}
