import 'package:ers_admin/screens/admin_dashboard_index/cubit/admin_tab_state.dart';

import 'package:ers_admin/shared/theme/app_colors.dart';

import '../../export.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../employees_screen/employees_screen.dart';
import '../feedback_form_screen/feedback_form_screen.dart';

import '../review_screen/review_screen.dart';
import '../view_review_screen/view_review_screen.dart';
import 'cubit/admin_tab_cubit.dart';
import 'widgets/drawer.dart';
import 'widgets/drawer_list.dart';
import 'widgets/leading_row.dart';
import 'widgets/selected_body_layout.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminCubit(),
      child: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          return Scaffold(
              key: context.read<AdminCubit>().scaffoldKey,
              appBar: AppBar(
                  surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                  toolbarHeight: Sizes.s60,
                  centerTitle: false,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leadingWidth:
                      Responsive.isDesktop(context) ? Sizes.s500 : Sizes.s100,
                  title: !Responsive.isDesktop(context)
                      ? Text(
                          context.read<AdminCubit>().pageName,
                          style: AppCss.outfitBold16.textColor(
                              Theme.of(context).colorScheme.onSecondary),
                        )
                      : Container(),
                  leading: LeadingRow(
                    scaffoldKey: context.read<AdminCubit>().scaffoldKey,
                    scaffoldDrawerKey:
                        context.read<AdminCubit>().scaffoldDrawerKey,
                  ),
                  actions: [
                    BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        final isDarkMode =
                            state.themeMode == ThemeModeState.dark;
                        return Switch(
                          value: isDarkMode,
                          onChanged: (value) {
                            context.read<ThemeBloc>().add(ToggleTheme());
                          },
                        );
                      },
                    ),
                    MaterialButton(
                        height: double.infinity,
                        hoverColor: Colors.transparent,
                        onPressed: () async {},
                        child: Icon(Icons.account_circle_outlined,
                            color: Theme.of(context).colorScheme.onSecondary))
                  ]),
              drawerScrimColor: Colors.transparent,
              drawer: const IndexDrawer(),
              body: SafeArea(
                  child: Scaffold(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      key: context.read<AdminCubit>().scaffoldDrawerKey,
                      body: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ValueListenableBuilder<bool>(
                                valueListenable:
                                    context.read<AdminCubit>().isOpen,
                                builder: (context, value, child) {
                                  return Responsive.isDesktop(context)
                                      ? Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: value ? Sizes.s280 : Sizes.s70,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          child: SingleChildScrollView(
                                              child: Column(
                                                  crossAxisAlignment: value
                                                      ? CrossAxisAlignment.start
                                                      : CrossAxisAlignment
                                                          .center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                Divider(
                                                    thickness: .5,
                                                    color: ErsAppColors.gray
                                                        .withOpacity(0.5),
                                                    indent: 12,
                                                    endIndent: 12),
                                                const VSpace(Sizes.s10),
                                                DrawerList(
                                                  value: value,
                                                  scaffoldKey: context
                                                      .read<AdminCubit>()
                                                      .scaffoldKey,
                                                )
                                              ])))
                                      : const SizedBox.shrink();
                                }),
                            SelectedIndexBodyLayout(
                              child: BlocBuilder<AdminCubit, AdminState>(
                                builder: (context, state) {
                                  //Restore Route on page refresh
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    context
                                        .read<AdminCubit>()
                                        .selectTab(state.currentTab);
                                  });
                                  switch (state.currentTab) {
                                    case NavigationTab.dashboard:
                                      return const DashboardScreen();
                                    case NavigationTab.feedback:
                                      return const FeedbackFormScreen();
                                    case NavigationTab.employee:
                                      return const EmployeeScreen();
                                    case NavigationTab.review:
                                      return const ReviewNavigator();
                                    default:
                                      return const DashboardScreen();
                                  }
                                },
                              ),
                            ),
                          ]))));
        },
      ),
    );
  }
}

//Child Screen Navigation

class ReviewNavigator extends StatelessWidget {
  const ReviewNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case '/review/details':
            // builder = (BuildContext _) => const ReviewDetailsScreen();
            builder = (BuildContext _) => ReviewDetailsScreen(
                  name: (settings.arguments as Map)['name'],
                  age: (settings.arguments as Map)['age'],
                );
            break;
          default:
            builder = (BuildContext _) => const ReviewScreen();
            break;
        }

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          settings: settings,
        );
      },
    );
  }
}
