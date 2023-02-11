import 'dart:async';
import 'package:clock_app/screens/home_page/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super ((HomeLoadingState())) ;

  changeState(HomeState state) {
    emit(state);
  }

thetime() {
TimeOfDay _timeOfDay = TimeOfDay.now();

Timer.periodic(Duration(seconds: 1), (timer) {
  if (_timeOfDay.minute != TimeOfDay.now().minute) {
    _timeOfDay = TimeOfDay.now();
    emit(HomeLoadedState());
  }
});
}

}