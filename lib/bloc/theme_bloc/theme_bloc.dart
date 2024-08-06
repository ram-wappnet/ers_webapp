import 'package:ers_admin/export.dart';
import 'package:get_storage/get_storage.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetStorage _box = GetStorage();

  ThemeBloc() : super(ThemeState(themeMode: _loadTheme())) {
    on<ToggleTheme>((event, emit) {
      final newTheme = state.themeMode == ThemeModeState.light
          ? ThemeModeState.dark
          : ThemeModeState.light;
      _box.write('themeMode', newTheme.index);
      emit(ThemeState(themeMode: newTheme));
    });
  }

  static ThemeModeState _loadTheme() {
    final box = GetStorage();
    final themeIndex = box.read('themeMode') ?? 0;
    return ThemeModeState.values[themeIndex];
  }
}

/* import 'package:ers_admin/export.dart';
import 'package:get_storage/get_storage.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(isDarkMode: _getInitialTheme())) {
    on<ToggleTheme>(_onToggleTheme);
  }

  static bool _getInitialTheme() {
    return GetStorage().read<bool>("isDarkMode") ?? false;
  }

  Future<void> _onToggleTheme(
      ToggleTheme event, Emitter<ThemeState> emit) async {
    final newTheme = !(state as ThemeInitial).isDarkMode;
    GetStorage().write("isDarkMode", newTheme);
    emit(ThemeInitial(isDarkMode: newTheme));
  }
}
 */