import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'storyshare_event.dart';
part 'storyshare_state.dart';

class StoryshareBloc extends Bloc<StoryshareEvent, StoryshareState> {
  StoryshareBloc() : super(StoryshareInitial());

  @override
  Stream<StoryshareState> mapEventToState(
    StoryshareEvent event,
  ) async* {
    if (event is StoryshareInitialEvent) {
      yield StoryshareLoadedState();
    }
  }
}
