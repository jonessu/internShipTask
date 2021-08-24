part of 'uploadimage_bloc.dart';

@immutable
abstract class UploadimageEvent {}

class UploadimageInitialEvent extends UploadimageEvent {}

class UploadClickBtnEvnet extends UploadimageEvent {
  File? image;
  UploadClickBtnEvnet({required this.image});
}
