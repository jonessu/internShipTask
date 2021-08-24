import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'encryption_event.dart';
part 'encryption_state.dart';

class EncryptionBloc extends Bloc<EncryptionEvent, EncryptionState> {
  EncryptionBloc() : super(EncryptionInitial());

  @override
  Stream<EncryptionState> mapEventToState(
    EncryptionEvent event,
  ) async* {
    if (event is EncryptionInitialEvent) {
      yield EncryptionLoadedState();
    }
  }
}
