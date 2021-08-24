import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tapspeak_event.dart';
part 'tapspeak_state.dart';

class TapspeakBloc extends Bloc<TapspeakEvent, TapspeakState> {
  TapspeakBloc() : super(TapspeakInitial());

  @override
  Stream<TapspeakState> mapEventToState(
    TapspeakEvent event,
  ) async* {
    if (event is TapspeakInitialEvent) {
      yield TapspeakLoadedState();
    }
  }
}
