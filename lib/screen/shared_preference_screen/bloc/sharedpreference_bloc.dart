import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sharedpreference_event.dart';
part 'sharedpreference_state.dart';

class SharedpreferenceBloc
    extends Bloc<SharedpreferenceEvent, SharedpreferenceState> {
  SharedpreferenceBloc() : super(SharedpreferenceInitial());

  @override
  Stream<SharedpreferenceState> mapEventToState(
    SharedpreferenceEvent event,
  ) async* {
    if (event is SharedpreferenceInitialEvent) {
      yield SharedpreferenceLoadedState();
    }
  }
}
