import 'package:ers_admin/export.dart';
import '../../../routes/app_route.dart';
import 'menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Insets.i20),
          child: Column(
            children: [
              NavItem(
                title: LocaleKeys.home.tr(),
                tapEvent: () {
                  Navigator.pop(context);
                },
              ),
              const VSpace(Sizes.s20),
              NavItem(
                title: LocaleKeys.aboutUs.tr(),
                tapEvent: () {
                  Navigator.pop(context);
                },
              ),
              const VSpace(Sizes.s20),
              NavItem(
                title: LocaleKeys.login.tr(),
                tapEvent: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, routeLoginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
