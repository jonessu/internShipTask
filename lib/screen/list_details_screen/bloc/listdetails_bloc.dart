import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'listdetails_event.dart';
part 'listdetails_state.dart';

class ListdetailsBloc extends Bloc<ListdetailsEvent, ListdetailsState> {
  ListdetailsBloc() : super(ListdetailsInitial());

  @override
  Stream<ListdetailsState> mapEventToState(
    ListdetailsEvent event,
  ) async* {
    if (event is ListdetailsInitialEvent) {
      yield ListdetailsLoadedState();
    }
  }
}
