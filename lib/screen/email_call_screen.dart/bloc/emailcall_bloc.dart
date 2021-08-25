import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'emailcall_event.dart';
part 'emailcall_state.dart';

class EmailcallBloc extends Bloc<EmailcallEvent, EmailcallState> {
  EmailcallBloc() : super(EmailcallInitial());

  @override
  Stream<EmailcallState> mapEventToState(
    EmailcallEvent event,
  ) async* {
    if (event is EmailcallInitialEvent) {
      yield EmailcallLoadedState();
    }
  }
}
