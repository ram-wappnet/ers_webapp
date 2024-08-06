// import 'package:universal_html/html.dart' as html;

import 'package:ers_admin/utils/helper/null_widget_helper.dart';

import '../../../export.dart';
import '../../../utils/helper/app_array.dart';
import '../cubit/admin_tab_cubit.dart';
import '../cubit/admin_tab_state.dart';

class DrawerList extends StatelessWidget {
  final bool? value;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const DrawerList({super.key, this.value, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((AdminCubit cubit) => cubit.state);
    final adminTabBloc = context.read<AdminCubit>();
    return Column(children: [
      ...AppArray().drawerList.asMap().entries.map<Widget>((e) {
        return InkWell(
          onTap: () {
            context
                .read<AdminCubit>()
                .selectTab(e.value["tab"]! as NavigationTab);
            adminTabBloc.pageName = e.value["title"]!.toString();

            if (!Responsive.isDesktop(context)) {
              Navigator.pop(context);
            }
            if (e.value["title"] == "logout") {
              printErsLog("index: ${adminTabBloc.isSelectedHover}");
            }
          },
          child: MouseRegion(
              onHover: (val) {
                adminTabBloc.isHover = true;
                adminTabBloc.isSelectedHover = e.key;
              },
              onExit: (exit) {
                adminTabBloc.isHover = false;
              },
              child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              Responsive.isDesktop(context) && value == false
                                  ? 0
                                  : Insets.i15,
                          vertical: Responsive.isDesktop(context) && value == false
                              ? 0
                              : Insets.i16),
                      width: double.infinity,
                      child: Responsive.isDesktop(context) && value == false
                          ? Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(Insets.i10),
                              height: Sizes.s45,
                              decoration: BoxDecoration(
                                color: selectedTab.currentTab ==
                                        e.value["tab"]! as NavigationTab
                                    ? Theme.of(context).primaryColor
                                    : adminTabBloc.isHover &&
                                            selectedTab.currentTab ==
                                                e.value["tab"]! as NavigationTab
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(0)),
                              ),
                              child: Tooltip(
                                  message: e.value["title"] != null
                                      ? e.value["title"].toString()
                                      : "",
                                  child: SvgPicture.asset(
                                      colorFilter: ColorFilter.mode(
                                          Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          BlendMode.srcIn),
                                      e.value["darkIcon"].toString())))
                          : Row(children: [
                              SvgPicture.asset(
                                e.value["darkIcon"]!.toString(),
                                height: Sizes.s18,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.onSurface,
                                    BlendMode.srcIn),
                              ),
                              const HSpace(Sizes.s20),
                              Responsive.isDesktop(context) && value == false
                                  ? nullWidget
                                  : Expanded(
                                      child: Text(
                                          e.value["title"] != null
                                              ? e.value["title"].toString()
                                              : "",
                                          style: AppCss.outfitMedium14
                                              .textColor(Colors.white)
                                              .letterSpace(.8)),
                                    )
                            ]))
                  // .inkWell(context, )
                  .decorated(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppRadius.r6)),
                      color: Responsive.isDesktop(context) && value == false
                          ? Colors.transparent
                          : selectedTab.currentTab ==
                                  e.value["tab"]! as NavigationTab
                              ? Theme.of(context).primaryColor
                              : adminTabBloc.isHover &&
                                      adminTabBloc.isSelectedHover == e.key
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.secondary)
                  .paddingSymmetric(horizontal: Responsive.isDesktop(context) && value == false ? 0 : Insets.i15, vertical: Insets.i5)),
        );
      })
    ]);
  }
}
