part of 'uploadimage_bloc.dart';

@immutable
abstract class UploadimageState {}

class UploadimageInitial extends UploadimageState {}

class UploadimageLoadedState extends UploadimageState {}

class UploadimageLoadingState extends UploadimageState {}

class UploadimageFailureState extends UploadimageState {}

class SnapBarImageState extends UploadimageState {}
