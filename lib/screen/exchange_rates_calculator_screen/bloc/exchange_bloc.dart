import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intershiptasks/data/Repository/currency_repository.dart';
import 'package:meta/meta.dart';

part 'exchange_event.dart';
part 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc() : super(ExchangeInitial());
  // List foundUsers = [];
  // List data = [];

  @override
  Stream<ExchangeState> mapEventToState(
    ExchangeEvent event,
  ) async* {
    if (event is ExchangeInitialEvent) {
      // data = await CurrencyRepository.fetchcurrencies();
      // print(data);
      // foundUsers = data;
      yield ExchangeLoadedState();
    }
  }
}
