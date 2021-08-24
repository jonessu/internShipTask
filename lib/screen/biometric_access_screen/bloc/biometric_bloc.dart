import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'biometric_event.dart';
part 'biometric_state.dart';

class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  BiometricBloc() : super(BiometricInitial());

  @override
  Stream<BiometricState> mapEventToState(
    BiometricEvent event,
  ) async* {
    if (event is BiometricInitialEvent) {
      yield BiometricLoadedState();
    }
  }
}
