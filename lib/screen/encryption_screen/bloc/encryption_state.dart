part of 'encryption_bloc.dart';

@immutable
abstract class EncryptionState {}

class EncryptionInitial extends EncryptionState {}

class EncryptionLoadedState extends EncryptionState {}

class EncryptionLoadingState extends EncryptionState {}

class EncryptionFailureState extends EncryptionState {}
