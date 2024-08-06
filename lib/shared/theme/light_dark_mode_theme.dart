import '../../export.dart';

/// Light theme
ThemeData themeLight(BuildContext context) => ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xFF7D6CF5),
      primaryColorLight: const Color(0xFF4B84E7),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
        brightness: Brightness.light,
        //USE
        primary: const Color(0xFF7D6CF5), //USE
        primaryContainer: Colors.white,
        //USE
        secondary: const Color(0xFF323444),
        //USE
        background: const Color(0xFFF8F9FC),
        surface: const Color(0xFF151A1E),
        onBackground: const Color(0xFFAFB0B6),
        //USE
        onSurface: Colors.white,
        onError: const Color(0xFFAFB0B6),
        //USE
        onPrimary: const Color(0xFF001928),
        //USE
        onSecondary: const Color(0xFF001928),
        secondaryContainer: const Color(0xFF001928),
        error: const Color(0xFFd32f2f),
      ),
    );

/// Dark theme
ThemeData themeDark(BuildContext context) => ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xFF7D6CF5),
      primaryColorLight: const Color(0xFF202020),
      scaffoldBackgroundColor: const Color(0xFF202020),
      colorScheme: const ColorScheme.dark().copyWith(
        brightness: Brightness.dark,
        //USE
        primaryContainer: const Color(0xFF151A1E),
        //USE
        primary: const Color(0xFF7D6CF5),
        //USE
        secondary: const Color(0xFF323444),
        //USE
        background: const Color(0xFF262626),
        surface: const Color(0xFF151A1E),
        onBackground: const Color(0xFFAFB0B6),
        //USE
        onSurface: Colors.white,
        onError: const Color(0xFFAFB0B6),
        //USE
        onPrimary: const Color(0xFF001928),
        //USE
        onSecondary: Colors.white,
        secondaryContainer: const Color(0xFFFFFFFF),
        error: const Color(0xFFd32f2f),
      ),
    );
