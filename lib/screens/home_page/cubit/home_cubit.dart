import 'package:clock_app/screens/home_page/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super ((HomeLoadingState())) ;

  changeState(HomeState state) {
    emit(state);
  }
}