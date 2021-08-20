import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customlist_event.dart';
part 'customlist_state.dart';

class CustomlistBloc extends Bloc<CustomlistEvent, CustomlistState> {
  CustomlistBloc() : super(CustomlistInitial());

  @override
  Stream<CustomlistState> mapEventToState(
    CustomlistEvent event,
  ) async* {
    if (event is CustomlistInitialEvent) {
      yield CustomlistLoadedState();
    }
  }
}
