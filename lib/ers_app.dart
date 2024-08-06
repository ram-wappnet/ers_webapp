import 'package:ers_admin/routes/app_route.dart';
import 'package:ers_admin/screens/admin_dashboard_index/cubit/admin_tab_cubit.dart';
import 'package:ers_admin/screens/dashboard_screen/bloc/dashboard_screen_bloc.dart';

import 'bloc/datatable_pagination_cubit/datatable_pagination_cubit.dart';
import 'bloc/language_bloc/language_bloc.dart';

import 'export.dart';
import 'main.dart';
import 'screens/pagenot_found/pagenot_found.dart';

class EFSAdminApp extends StatelessWidget {
  const EFSAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: const Color(0xFF7D6CF5),
        statusBarBrightness: Brightness.light,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
        BlocProvider(
          create: (context) => PaginationCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => AdminCubit(),
        ),
        BlocProvider(
          create: (context) => DashboardScreenBloc(),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: MediaQuery.of(context).size.width < 600
                ? const Size(375, 812) // Mobile design size
                : MediaQuery.of(context).size.width < 1200
                    ? const Size(600, 1024) // Tablet design size
                    : const Size(1440, 1024), // Desktop design size,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                initialRoute: routeLandingScreen,
                routes: routes,
                onUnknownRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => const PageNotFound(),
                  );
                },
                theme: themeLight(context),
                darkTheme: themeDark(context),
                themeMode: state.themeMode == ThemeModeState.light
                    ? ThemeMode.light
                    : ThemeMode.dark,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                title: "EFS",
                scrollBehavior: MyCustomScrollBehavior(),
              );
            },
          );
        },
      ),
    );
  }
}
