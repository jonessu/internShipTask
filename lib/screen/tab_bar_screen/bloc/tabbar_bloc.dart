import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intershiptasks/data/models/tab4_model.dart';
import 'package:meta/meta.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(TabbarInitial());

  List<Choice> choices = <Choice>[
    Choice(title: 'CAR', icon: Icons.directions_car),
    Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    Choice(title: 'BUS', icon: Icons.directions_bus),
    Choice(title: 'TRAIN', icon: Icons.directions_railway),
  ];

  @override
  Stream<TabbarState> mapEventToState(
    TabbarEvent event,
  ) async* {
    if (event is TabbarInitialEvent) {
      yield TabbarLoadedState();
    }
  }
}
