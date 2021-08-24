part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoadedState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactFailureState extends ContactState {}
