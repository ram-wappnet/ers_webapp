import 'package:ers_admin/screens/admin_dashboard_index/widgets/drawer_list.dart';

import '../../../export.dart';
import '../cubit/admin_tab_cubit.dart';

class IndexDrawer extends StatelessWidget {
  const IndexDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: context.read<AdminCubit>().isOpen,
        builder: (context, value, child) {
          return MouseRegion(
            /*     onHover: (val) {
              context.read<AdminCubit>().isHover = true;
            },
            onExit: (exit) {
              context.read<AdminCubit>().isHover = false;
            },
            onEnter: (enter) {
              context.read<AdminCubit>().isHover = true;
            }, */
            child: Drawer(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                elevation: 2,
                child: ListView(children: [
                  const VSpace(Sizes.s20),
                  SvgPicture.asset(AssetConstants.assetAppLogo,
                          height: Sizes.s40)
                      .backgroundColor(Theme.of(context).colorScheme.secondary),
                  const VSpace(Sizes.s20),
                  Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      indent: 12,
                      endIndent: 12),
                  const VSpace(Sizes.s20),
                  DrawerList(value: value)
                ])),
          );
        });
  }
}
