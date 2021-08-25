import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'instastory_event.dart';
part 'instastory_state.dart';

class InstastoryBloc extends Bloc<InstastoryEvent, InstastoryState> {
  InstastoryBloc() : super(InstastoryInitial());

  @override
  Stream<InstastoryState> mapEventToState(
    InstastoryEvent event,
  ) async* {
    if (event is InstastoryInitialEvent) {
      yield InstastoryLoadedState();
    }
  }
}
