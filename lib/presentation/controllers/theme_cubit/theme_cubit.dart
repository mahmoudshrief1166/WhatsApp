
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/utills/core/dark_theme.dart';
import 'package:whats_app/utills/core/light_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);

  void toggleTheme() {
    emit(
      ChangeTheme(
        state.themeData == LightTheme.lightTheme
            ? DarkTheme.darkTheme
            : LightTheme.lightTheme,
      ),
    );
  }
}
