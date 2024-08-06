import '../../../export.dart';
import '../cubit/admin_tab_cubit.dart';
import '../cubit/admin_tab_state.dart';

class SelectedIndexBodyLayout extends StatelessWidget {
  final Widget child;

  const SelectedIndexBodyLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SelectionArea(
            child: CustomScrollView(
                shrinkWrap: true,
                controller: ScrollController(),
                slivers: [
          SliverList(
              delegate: SliverChildListDelegate(addAutomaticKeepAlives: true, [
            Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: Insets.i24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (Responsive.isDesktop(context))
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              BlocBuilder<AdminCubit, AdminState>(
                                buildWhen: (previous, current) {
                                  return previous.currentTab !=
                                      previous.currentTab;
                                },
                                builder: (context, state) {
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SelectableText(
                                            context.read<AdminCubit>().pageName,
                                            style: AppCss.outfitMedium18
                                                .textColor(Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary)),
                                        const VSpace(Sizes.s8),
                                        Row(children: [
                                          InkWell(
                                              mouseCursor:
                                                  SystemMouseCursors.click,
                                              //TODO TRAS
                                              child: SelectableText("Admin",
                                                  style: AppCss.outfitMedium14
                                                      .textColor(
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .onSecondary))),
                                          SelectableText('  /  ',
                                              style: AppCss.outfitMedium14
                                                  .textColor(Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary)),
                                          SelectableText(
                                            context.read<AdminCubit>().pageName,
                                            style: AppCss.outfitMedium14
                                                .textColor(Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary),
                                          ),
                                        ])
                                      ]);
                                },
                              ),
                            ]),
                      const VSpace(Sizes.s20),
                      child
                    ]))
          ])),
          SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: const Column(
                      children: <Widget>[Expanded(child: SizedBox.shrink())])
                  .backgroundColor(Theme.of(context).scaffoldBackgroundColor))
        ])));
  }
}
