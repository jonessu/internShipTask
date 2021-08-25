import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'walkthrough_event.dart';
part 'walkthrough_state.dart';

class WalkthroughBloc extends Bloc<WalkthroughEvent, WalkthroughState> {
  WalkthroughBloc() : super(WalkthroughInitial());

  @override
  Stream<WalkthroughState> mapEventToState(
    WalkthroughEvent event,
  ) async* {
    if (event is WalkthroughInitialEvent) {
      yield WalkthroughLoadedState();
    }
  }
}
