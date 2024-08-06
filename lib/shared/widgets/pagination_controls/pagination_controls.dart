import '../../../export.dart';

import 'icon_button_custom_widget.dart';

class PaginationControls<T> extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final void Function(int page) onPageChanged;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButtonCustomWidget(
          icon: Icons.first_page,
          onPressed: currentPage > 1 ? () => onPageChanged(1) : null,
        ),
        const HSpace(Sizes.s10),
        IconButtonCustomWidget(
          icon: Icons.chevron_left,
          onPressed:
              currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        const HSpace(Sizes.s20),
        Text(
          'Page $currentPage of $totalPages',
          style: AppCss.outfitMedium14
              .textColor(Theme.of(context).colorScheme.onSecondary),
        ),
        const HSpace(Sizes.s20),
        IconButtonCustomWidget(
          icon: Icons.chevron_right,
          onPressed: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
        ),
        const HSpace(Sizes.s10),
        IconButtonCustomWidget(
          icon: Icons.last_page,
          onPressed:
              currentPage < totalPages ? () => onPageChanged(totalPages) : null,
        ),
      ],
    );
  }
}
