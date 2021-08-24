part of 'exchange_bloc.dart';

@immutable
abstract class ExchangeState {}

class ExchangeInitial extends ExchangeState {}

class ExchangeLoadedState extends ExchangeState {}

class ExchangeLoadingState extends ExchangeState {}

class ExchangeFailureState extends ExchangeState {}
