import 'dart:developer';

import '../../../export.dart';
import '../cubit/admin_tab_cubit.dart';

class LeadingRow extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const LeadingRow({
    super.key,
    this.scaffoldKey,
    this.scaffoldDrawerKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ValueListenableBuilder<bool>(
          valueListenable: context.read<AdminCubit>().isOpen,
          builder: (context, value, child) {
            if (Responsive.isDesktop(context) && value) {
              return InkWell(
                  onTap: () {
                    log("message");
                  },
                  child: Container(
                      width: value ? Sizes.s280 : Sizes.s70,
                      padding: const EdgeInsets.symmetric(vertical: Insets.i10),
                      color: Theme.of(context).colorScheme.secondary,
                      child: SvgPicture.asset(AssetConstants.assetAppLogo)));
            }
            return InkWell(
                onTap: () {
                  log("message1 : ${context.read<AdminCubit>().scaffoldDrawerKey}");
                  scaffoldDrawerKey!.currentState?.closeDrawer();
                },
                child: Responsive.isDesktop(context)
                    ? Container(
                        width: Sizes.s70,
                        padding: const EdgeInsets.all(Insets.i10),
                        color: Theme.of(context).colorScheme.secondary,
                        height: double.infinity,
                        child: SvgPicture.asset(AssetConstants.assetAppLogo,
                            width: Sizes.s10,
                            height: Sizes.s10,
                            fit: BoxFit.contain))
                    : Container());
          }),
      MaterialButton(
          height: double.infinity,
          hoverColor: Colors.transparent,
          onPressed: () async {
            printErsLog("messageMaterial : $scaffoldDrawerKey");
            if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
              printErsLog(Responsive.isTablet(context).toString());
              if (scaffoldKey!.currentState!.isDrawerOpen) {
                scaffoldKey!.currentState!.closeDrawer();
              } else {
                try {
                  scaffoldKey!.currentState!.openDrawer();
                  printErsLog("message");
                } catch (e) {
                  printErsLog(e.toString());
                }
              }
            } else if (Responsive.isDesktop(context)) {
              scaffoldKey!.currentState!.closeDrawer();
              context.read<AdminCubit>().toggleMenu();
            }
          },
          child: Icon(Icons.menu,
              color: Theme.of(context).colorScheme.onSecondary))
    ]);
  }
}
