import 'package:ers_admin/export.dart';

import 'package:ers_admin/shared/theme/app_colors.dart';

import '../../../bloc/datatable_pagination_cubit/datatable_pagination_cubit.dart';
import '../pagination_controls/icon_button_custom_widget.dart';
import '../pagination_controls/pagination_controls.dart';

class MyCustomDataTable<T extends Object> extends StatefulWidget {
  final List<DataColumn> columns;
  final List<DataRow> Function(List<T> items) rows;
  final String apiUrl;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, String>? queryParameters;
  final double dataRowHeight;
  final double headingRowHeight;

  final Widget? createButton;
  final Widget? refreshButton;

  const MyCustomDataTable({
    super.key,
    required this.apiUrl,
    required this.fromJson,
    required this.columns,
    required this.rows,
    this.queryParameters,
    required this.dataRowHeight,
    required this.headingRowHeight,
    this.createButton,
    this.refreshButton,
  });

  @override
  State<MyCustomDataTable<T>> createState() => _MyCustomDataTableState<T>();
}

class _MyCustomDataTableState<T extends Object>
    extends State<MyCustomDataTable<T>> with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  final GlobalKey tableKey = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  int _currentPage = 1;
  int _totalPage = 1;
  String _searchQuery = '';

  @override
  void dispose() {
    scrollController.dispose();
    verticalScroll.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  bool get wantKeepAlive => true;

  void _fetchData() {
    context.read<PaginationCubit<T>>().fetchData(
      apiUrl: widget.apiUrl,
      page: _currentPage,
      fromJson: widget.fromJson,
      queryParameters: {
        ...?widget.queryParameters,
        if (_searchQuery.isNotEmpty) 'q': _searchQuery,
      },
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    _fetchData();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 1;
    });
    _fetchData();
  }

  void _resetAll() {
    setState(() {
      _searchQuery = '';
      searchController.clear();
      _currentPage = 1;
    });
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(
        context); // Call super.build to ensure AutomaticKeepAliveClientMixin works
    return Column(
      children: [
        const VSpace(Sizes.s10),
        Row(
          children: [
            Expanded(
              child: InputTextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                suffixIcon: const Icon(
                  size: Sizes.s22,
                  Icons.search,
                ),
                hintText: "Type to start search...",
                onFieldSubmitted: (value) {
                  _onSearchChanged(value);
                },
                editingController: searchController,
              ),
            ),
            const HSpace(Sizes.s10),
            IconButtonCustomWidget(
              height: Sizes.s50,
              width: Sizes.s45,
              icon: Icons.refresh,
              onPressed: () {
                _resetAll();
              },
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<PaginationCubit<T>, PaginationState<T>>(
            builder: (context, state) {
              if (state is PaginationLoading<T>) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PaginationLoaded<T>) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    _totalPage = state.totalPages;
                  });
                });

                if (state.data.isEmpty) {
                  return Center(
                    child: Text(
                      "No data",
                      style: AppCss.outfitMedium14
                          .textColor(ErsAppColors.orangeColor),
                    ),
                  );
                } else {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return ListView(
                        controller: verticalScroll,
                        children: [
                          RawScrollbar(
                            thumbColor: Theme.of(context).primaryColor,
                            controller: scrollController,
                            thumbVisibility: true,
                            interactive: true,
                            scrollbarOrientation: ScrollbarOrientation.bottom,
                            trackVisibility: true,
                            thickness: AppRadius.r5,
                            radius: const Radius.circular(AppRadius.r5),
                            child: SingleChildScrollView(
                              padding:
                                  const EdgeInsets.only(bottom: Insets.i20),
                              controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: constraints.maxWidth,
                                ),
                                child: DataTable(
                                  key: tableKey,
                                  showCheckboxColumn: true,
                                  headingTextStyle:
                                      AppCss.outfitMedium16.textColor(
                                    Theme.of(context).colorScheme.onSecondary,
                                  ),
                                  dataTextStyle:
                                      AppCss.outfitMedium14.textColor(
                                    Theme.of(context).colorScheme.onSecondary,
                                  ),
                                  columnSpacing: Sizes.s10,
                                  headingRowHeight: widget.headingRowHeight,
                                  dataRowHeight: widget.dataRowHeight,
                                  columns: widget.columns,
                                  showBottomBorder: true,
                                  rows: widget.rows(state.data),
                                ),
                              ),
                            ),
                          ),
                          const VSpace(Sizes.s10),
                        ],
                      );
                    },
                  );
                }
              } else if (state is PaginationError<T>) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Unexpected State'));
              }
            },
          ),
        ),
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: PaginationControls(
              currentPage: _currentPage,
              totalPages: _totalPage,
              onPageChanged: _onPageChanged,
            ),
          ),
        )
      ],
    );
  }
}
