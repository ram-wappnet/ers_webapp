import '../../../../export.dart';

class DashboardTitleCount extends StatelessWidget {
  final String? count, title;

  const DashboardTitleCount({super.key, this.count, this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title ?? "",
          maxLines: 2,
          overflow: TextOverflow.clip,
          style: AppCss.outfitMedium16
              .textColor(Theme.of(context).colorScheme.onSecondary)
              .letterSpace(1.3)),
      const VSpace(Sizes.s15),
      Text(count ?? "",
          maxLines: 2,
          overflow: TextOverflow.clip,
          style: AppCss.outfitSemiBold20
              .textColor(Theme.of(context).colorScheme.primary)),
    ]));
  }
}
