import 'dart:developer';

import 'package:ers_admin/routes/app_route.dart';

import '../../../export.dart';
import 'menu_item.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: Insets.i10, horizontal: Insets.i20),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            AssetConstants.assetAppLogo,
            width: Sizes.s30,
          ),
          const HSpace(Sizes.s10),
          Text(
              Responsive.isMobile(context)
                  ? LocaleKeys.ers.tr()
                  : LocaleKeys.employeeFeedbackSystem.tr(),
              style: AppCss.outfitBold20
                  .textColor(Theme.of(context).primaryColor)),
          const Spacer(),
          if (!Responsive.isMobile(context))
            Row(
              children: [
                NavItem(
                  title: LocaleKeys.home.tr(),
                  tapEvent: () {},
                ),
                NavItem(
                  title: LocaleKeys.aboutUs.tr(),
                  tapEvent: () {},
                ),
                CommonButtonWidget(
                    style: AppCss.outfitBold14
                        .textColor(Theme.of(context).colorScheme.onSurface),
                    width: Sizes.s80,
                    height: Sizes.s25,
                    title: LocaleKeys.login.tr(),
                    onTap: () {
                      log("message");
                      Navigator.pushNamed(context, routeLoginScreen);
                    }),
              ],
            ),
          if (Responsive.isMobile(context))
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                })
        ],
      ),
    );
  }
}
