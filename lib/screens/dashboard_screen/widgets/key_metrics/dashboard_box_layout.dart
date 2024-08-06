import '../../../../export.dart';
import 'dashboard_title_count.dart';

class DashboardBoxLayout extends StatelessWidget {
  final int? count;
  final String? title;

  const DashboardBoxLayout({super.key, this.count, this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Insets.i20, vertical: Insets.i10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(Insets.i1),
              border:
                  Border.all(color: const Color(0xFF8A95A4).withOpacity(.10)),
              // side:
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardTitleCount(
                            count: count.toString(), title: title.toString()),
                        MediaQuery.of(context).size.width < 1420
                            ? Expanded(
                                child: SvgPicture.asset(
                                AssetConstants.assetAppLogo,
                                height: MediaQuery.of(context).size.width < 1420
                                    ? Sizes.s30
                                    : Sizes.s60,
                              ))
                            : SvgPicture.asset(
                                AssetConstants.assetAppLogo,
                                height: Sizes.s60,
                              )
                      ])
                ])),

        // .boxExtension(),
        Container(
          height: Sizes.s50,
          width: 4,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(Insets.i8),
          ),
        )
      ],
    );
  }
}
