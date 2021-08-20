import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(TabbarInitial());

  @override
  Stream<TabbarState> mapEventToState(
    TabbarEvent event,
  ) async* {
    if (event is TabbarInitialEvent) {
      yield TabbarLoadedState();
    }
  }
}
