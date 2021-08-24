import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intershiptasks/data/Repository/Image_post_api.dart';
import 'package:intershiptasks/utils/image_resource.dart';
import 'package:meta/meta.dart';

part 'uploadimage_event.dart';
part 'uploadimage_state.dart';

class UploadimageBloc extends Bloc<UploadimageEvent, UploadimageState> {
  UploadimageBloc() : super(UploadimageInitial());
  File? image;

  @override
  Stream<UploadimageState> mapEventToState(
    UploadimageEvent event,
  ) async* {
    if (event is UploadimageInitialEvent) {
      yield UploadimageLoadedState();
    } else if (event is UploadClickBtnEvnet) {
      var data = await PostImageRepository.postImage(event.image);
      print(data);
    }
  }
}
