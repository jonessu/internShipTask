part of 'biometric_bloc.dart';

@immutable
abstract class BiometricState {}

class BiometricInitial extends BiometricState {}

class BiometricLoadedState extends BiometricState {}

class BiometricLoadingState extends BiometricState {}

class BiometricFailureState extends BiometricState {}
