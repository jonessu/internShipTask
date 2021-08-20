import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intershiptasks/data/searching_data_list.dart';
import 'package:meta/meta.dart';

part 'searchlist_event.dart';
part 'searchlist_state.dart';

class SearchlistBloc extends Bloc<SearchlistEvent, SearchlistState> {
  SearchlistBloc() : super(SearchlistInitial());
  List<Map<String, dynamic>> foundUsers = [];

  @override
  Stream<SearchlistState> mapEventToState(
    SearchlistEvent event,
  ) async* {
    if (event is SearchlistInitialEvent) {
      foundUsers = searchlist;
      yield SearchlistLoadedState();
    }
  }
}
