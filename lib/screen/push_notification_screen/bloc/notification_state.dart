part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoadedState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationFailureState extends NotificationState {}
