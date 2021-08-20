import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:meta/meta.dart';

part 'loginform_event.dart';
part 'loginform_state.dart';

class LoginformBloc extends Bloc<LoginformEvent, LoginformState> {
  LoginformBloc() : super(LoginformInitial());
  final usernamerequiredValidator = MultiValidator([
    RequiredValidator(errorText: "Required Username"),
  ]);
  final emailrequiredValidator = MultiValidator([
    RequiredValidator(errorText: "Required Email"),
    EmailValidator(errorText: "Not a Vaild Email!")
  ]);
  final passwordrequiredValidator = MultiValidator([
    RequiredValidator(errorText: "Required Password"),
    MaxLengthValidator(10, errorText: "Should Not more than 10 charcators!"),
  ]);

  @override
  Stream<LoginformState> mapEventToState(
    LoginformEvent event,
  ) async* {
    if (event is LoginformInitialEvent) {
      yield LoginformLoadedState();
    }
    if (event is LoginformClickEvent) {
      yield LoginformNavigationState();
    }
  }
}
