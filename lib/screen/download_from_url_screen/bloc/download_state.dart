part of 'download_bloc.dart';

@immutable
abstract class DownloadState {}

class DownloadInitial extends DownloadState {}

class DownloadLoadedState extends DownloadState {}

class DownloadLoadingState extends DownloadState {}

class DownloadFailureState extends DownloadState {}
