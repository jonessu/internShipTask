import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'localisation_event.dart';
part 'localisation_state.dart';

class LocalisationBloc extends Bloc<LocalisationEvent, LocalisationState> {
  LocalisationBloc() : super(LocalisationInitial());

  @override
  Stream<LocalisationState> mapEventToState(
    LocalisationEvent event,
  ) async* {
    if (event is LocalisationInitialEvent) {
      yield LocalisationLoadedState();
    }
  }
}
