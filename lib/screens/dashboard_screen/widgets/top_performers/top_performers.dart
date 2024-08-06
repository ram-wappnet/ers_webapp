import 'package:ers_admin/export.dart';
import 'package:ers_admin/shared/theme/app_colors.dart';

import '../../../../bloc/datatable_pagination_cubit/datatable_pagination_cubit.dart';

import '../../../../shared/models/post_response_model.dart';
import '../../../../shared/widgets/text_colour_avatar_widget.dart';
import '../../../../shared/widgets/datatable_pagination_widget/datatable_pagination_widget.dart';

class TopPerformersWidget extends StatefulWidget {
  const TopPerformersWidget({super.key});

  @override
  State<TopPerformersWidget> createState() => _TopPerformersWidgetState();
}

class _TopPerformersWidgetState extends State<TopPerformersWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(
        context); // Call super.build to ensure AutomaticKeepAliveClientMixin works
    return Container(
      height: Sizes.s500,
      width: double.infinity,
      padding: const EdgeInsets.all(Insets.i16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Performers",
              style: AppCss.outfitLight16
                  .textColor(Theme.of(context).colorScheme.onSecondary)),
          // const VSpace(Sizes.s20),
          Expanded(
            child: BlocProvider(
              create: (_) => PaginationCubit<Post>(),
              child: MyCustomDataTable<Post>(
                createButton: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Create"),
                ),
                dataRowHeight: 50,
                headingRowHeight: 60,
                apiUrl: 'https://jsonplaceholder.typicode.com/posts',
                fromJson: (json) => Post.fromJson(json),
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(
                    label: Text("Name"),
                  ),
                  DataColumn(
                    label: Text("Position"),
                  ),
                  DataColumn(label: Text('Action')),
                ],
                rows: (items) {
                  return List<DataRow>.generate(
                    items.length,
                    (index) {
                      final post = items[index];
                      return DataRow(
                        /*  color: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return index % 2 == 0
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2)
                                : Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.2);
                          },
                        ), */
                        cells: [
                          DataCell(Text(post.id.toString())),
                          DataCell(
                            Row(
                              children: [
                                TextAvatar(
                                  size: 35,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.white,
                                  fontSize: 14,
                                  upperCase: true,
                                  numberLetters: 1,
                                  text: post.title,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    post.title.split(" ").first.toUpperCase(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DataCell(Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: ErsAppColors.orangeColor.withOpacity(.2),
                                border:
                                    Border.all(color: ErsAppColors.orangeColor),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(1) //
                                        ),
                              ),
                              child: Text(
                                  post.title.split(" ").last.toUpperCase()))),
                          DataCell(
                            TextButton(
                              child: const Text('View',
                                  style: TextStyle(color: Colors.green)),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
