import 'package:ers_admin/routes/app_route.dart';

import '../../../export.dart';

class Jumbotron extends StatelessWidget {
  const Jumbotron({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: Insets.i50),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(
                  right: !Responsive.isMobile(context) ? Insets.i100 : 0),
              child: Column(
                mainAxisAlignment: !Responsive.isMobile(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: !Responsive.isMobile(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: <Widget>[
                  if (Responsive.isMobile(context)) ...[
                    SvgPicture.asset(
                      AssetConstants.assetLandingJumboPeople,
                      height: Sizes.s150,
                    ),
                    const VSpace(Sizes.s20),
                  ],
                  RichText(
                      textAlign: !Responsive.isMobile(context)
                          ? TextAlign.start
                          : TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: '${LocaleKeys.welcomeTo.tr()}\n',
                          style: AppCss.outfitBold24.textColor(
                              Theme.of(context).colorScheme.onSecondary),
                        ),
                        TextSpan(
                          text: LocaleKeys.employeeFeedback.tr(),
                          style: AppCss.outfitBold28
                              .textColor(Theme.of(context).colorScheme.primary),
                        ),
                      ])),
                  Text(
                    LocaleKeys.system.tr(),
                    style: AppCss.outfitBold24
                        .textColor(Theme.of(context).colorScheme.onSecondary),
                  ),
                  const VSpace(Sizes.s20),
                  Text(LocaleKeys.weValueYourInsights.tr(),
                      textAlign: Responsive.isMobile(context)
                          ? TextAlign.center
                          : TextAlign.start,
                      style: AppCss.outfitRegular14.textColor(
                          Theme.of(context).colorScheme.onBackground)),
                  const VSpace(Sizes.s20),
                  CommonButtonWidget(
                      style: AppCss.outfitBold14
                          .textColor(Theme.of(context).colorScheme.onSurface),
                      width: Sizes.s150,
                      height: Sizes.s30,
                      title: LocaleKeys.getStarted.tr(),
                      onTap: () =>
                          Navigator.pushNamed(context, routeLoginScreen))
                ],
              ),
            )),
            if (Responsive.isDesktop(context) || Responsive.isTablet(context))
              Expanded(
                  child: SvgPicture.asset(
                AssetConstants.assetLandingJumboPeople,
                height: Sizes.s380,
              ))
          ],
        ));
  }
}
