import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selection_event.dart';
part 'selection_state.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  SelectionBloc() : super(SelectionInitial());

  @override
  Stream<SelectionState> mapEventToState(
    SelectionEvent event,
  ) async* {
    if (event is SelectionInitialEvent) {
      yield SelectionLoadedState();
    }
  }
}
