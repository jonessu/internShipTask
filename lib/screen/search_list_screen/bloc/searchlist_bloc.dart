import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intershiptasks/data/Repository/data_resourcr_api.dart';
import 'package:intershiptasks/data/models/data_models.dart';
import 'package:intershiptasks/data/searching_data_list.dart';
import 'package:meta/meta.dart';

part 'searchlist_event.dart';
part 'searchlist_state.dart';

class SearchlistBloc extends Bloc<SearchlistEvent, SearchlistState> {
  SearchlistBloc() : super(SearchlistInitial());
  List foundUsers = [];
  List data = [];

  @override
  Stream<SearchlistState> mapEventToState(
    SearchlistEvent event,
  ) async* {
    if (event is SearchlistInitialEvent) {
      data = await PostRepository.fetchPosts();
      print(data);
      foundUsers = data;
      yield SearchlistLoadedState();
    }
  }
}
