import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customwidget_event.dart';
part 'customwidget_state.dart';

class CustomwidgetBloc extends Bloc<CustomwidgetEvent, CustomwidgetState> {
  CustomwidgetBloc() : super(CustomwidgetInitial());

  bool switchValue = false;

  @override
  Stream<CustomwidgetState> mapEventToState(
    CustomwidgetEvent event,
  ) async* {
    if (event is CustomwidgetInitialEvent) {
      yield CustomwidgetLoadedState();
    }
  }
}
