import '../../../export.dart';

class NavigationFooter extends StatelessWidget {
  const NavigationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Insets.i10),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.spaceAround,
        direction: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? Axis.vertical
            : Axis.horizontal,
        children: [
          // Navigation Logo
          Text(
            '🎉  Wappnet System  🎉',
            style: AppCss.outfitLight14
                .textColor(Theme.of(context).colorScheme.onSecondary),
          ),
          // Menu list
          Padding(
            padding: const EdgeInsets.all(Insets.i20),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.end,
              direction:
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? Axis.horizontal
                      : Axis.horizontal,
              spacing: 40,
              runSpacing: 30,
              children: [
                Text(
                  LocaleKeys.termsOfService.tr(),
                  style: AppCss.outfitLight14
                      .textColor(Theme.of(context).colorScheme.onSecondary),
                ),
                Text(
                  LocaleKeys.privacyPolicy.tr(),
                  style: AppCss.outfitLight14
                      .textColor(Theme.of(context).colorScheme.onSecondary),
                ),
                Text(
                  LocaleKeys.contactUs.tr(),
                  style: AppCss.outfitLight14
                      .textColor(Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
          ),

          // Copyright text
          Text(
            "Wappnet Systems Pvt. Ltd. | ${DateTime.now().year} All rights reserved",
            style: AppCss.outfitLight14
                .textColor(Theme.of(context).colorScheme.onSecondary),
          ),
        ],
      ),
    );
  }
}
