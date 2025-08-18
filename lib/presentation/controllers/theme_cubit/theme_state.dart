part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState({required this.themeData});

  @override
  List<Object> get props => [themeData];
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(themeData: LightTheme.lightTheme);
}

class ChangeTheme extends ThemeState {
  const ChangeTheme(ThemeData themeData) : super(themeData: themeData);
}
