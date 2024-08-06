part of 'theme_bloc.dart';

enum ThemeModeState { light, dark }

class ThemeState extends Equatable {
  final ThemeModeState themeMode;

  const ThemeState({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

/* part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  final bool isDarkMode;

  const ThemeInitial({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}
 */