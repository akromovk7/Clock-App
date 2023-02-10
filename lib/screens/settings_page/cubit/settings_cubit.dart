import 'package:clock_app/screens/settings_page/state/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit():super(ThemeInitial());

  bool _isDark=false;
  bool get isDark=>_isDark;

  void changeTheme(){
    _isDark=!_isDark;
    emit(ThemeChanged());
  }
}