import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lottieview_event.dart';
part 'lottieview_state.dart';

class LottieviewBloc extends Bloc<LottieviewEvent, LottieviewState> {
  LottieviewBloc() : super(LottieviewInitial());

  @override
  Stream<LottieviewState> mapEventToState(
    LottieviewEvent event,
  ) async* {
    if (event is LottieviewInitialEvent) {
      yield LottieviewLoadedState();
    }
  }
}
