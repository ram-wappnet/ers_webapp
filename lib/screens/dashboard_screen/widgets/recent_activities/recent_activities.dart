import 'package:ers_admin/export.dart';
import 'package:ers_admin/shared/widgets/custom_network_image_widget/custom_network_image_widget.dart';

import '../../../../utils/helper/app_array.dart';

class RecentActivitiesWidget extends StatelessWidget {
  const RecentActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.s350,
      width: double.infinity,
      padding: const EdgeInsets.all(Insets.i16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent Activities",
              style: AppCss.outfitLight16
                  .textColor(Theme.of(context).colorScheme.onSecondary)),
          const VSpace(Sizes.s10),
          Expanded(
            child: Column(
              children: AppArray()
                  .recentFormsSubmitted
                  .asMap()
                  .entries
                  .map(
                    (e) => ListTaskAssigned(
                      data: e.value,
                      onPressed: () {},
                      onPressedAssign: () {},
                      onPressedMember: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
          // const VSpace(Sizes.s20),
        ],
      ),
    );
  }
}

class ListTaskAssigned extends StatelessWidget {
  const ListTaskAssigned({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    super.key,
  });

  final ListTaskAssignedData data;
  final Function() onPressed;
  final Function()? onPressedAssign;
  final Function()? onPressedMember;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      hoverColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      leading: _buildIcon(),
      title: _buildTitle(context),
      subtitle: _buildSubtitle(context),
      trailing: _buildAssign(context),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(Insets.i5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      // child: data.icon,
      child: CustomNetworkImageWidget(
          isCircular: true,
          imageUrl:
              "https://static.vecteezy.com/system/resources/thumbnails/042/055/246/small/ai-generated-businessman-portrait-portrait-of-businessman-png.png",
          name: data.label),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      data.label,
      style: AppCss.outfitLight16
          .textColor(Theme.of(context).colorScheme.onSecondary),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    String edit = "";

    if (data.editDate != null) {
      edit = " \u2022 Date : ${(data.editDate!)}";
    }

    return Text(
      data.jobDesk + edit,
      maxLines: 1,
      style: AppCss.outfitLight14
          .textColor(Theme.of(context).colorScheme.onSecondary),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAssign(BuildContext context) {
    return InkWell(
      onTap: onPressedMember,
      borderRadius: BorderRadius.circular(22),
      child: Tooltip(
        message: data.label,
        child: CircleAvatar(
          radius: 22,
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(.2),
          child: Text(
            "3.2",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
