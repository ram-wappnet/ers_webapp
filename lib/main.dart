/* import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'export.dart';

class DataTableCubit extends Cubit<DataTableState> {
  DataTableCubit() : super(DataTableInitial());

  final int pageSize = 10;

  void fetchData(int page, String query) async {
    emit(DataTableLoading());

    // Dummy API URL
    final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http
        .get(Uri.parse('$apiUrl?_page=$page&_limit=$pageSize&q=$query'));
    log(response?.request?.url.queryParametersAll.toString() ?? "");

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      final int totalItems = int.parse(response.headers['x-total-count'] ??
          '100'); // Assuming a total count is provided in the headers
      final int totalPages = (totalItems / pageSize).ceil();
      emit(DataTableLoaded(data, page, totalPages));
    } else {
      emit(DataTableError('Failed to fetch data'));
    }
  }
}

@immutable
abstract class DataTableState {}

class DataTableInitial extends DataTableState {}

class DataTableLoading extends DataTableState {}

class DataTableLoaded extends DataTableState {
  final List data;
  final int currentPage;
  final int totalPages;

  DataTableLoaded(this.data, this.currentPage, this.totalPages);
}

class DataTableError extends DataTableState {
  final String message;

  DataTableError(this.message);
}

class DataTableWidget extends StatefulWidget {
  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  int _currentPage = 1;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<DataTableCubit>().fetchData(_currentPage, _searchQuery);
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 1;
    });
    context.read<DataTableCubit>().fetchData(_currentPage, _searchQuery);
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    context.read<DataTableCubit>().fetchData(_currentPage, _searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: _onSearchChanged,
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: BlocBuilder<DataTableCubit, DataTableState>(
            builder: (context, state) {
              if (state is DataTableLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is DataTableLoaded) {
                if (state.data.isEmpty) {
                  return Center(child: Text('No Data Available'));
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(
                          label: Text('ID',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Title',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('userid',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('body',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: state.data.asMap().entries.map((entry) {
                      int index = entry.key;
                      var item = entry.value;
                      return DataRow(
                        color: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return index % 2 == 0
                                ? Colors.grey.withOpacity(0.1)
                                : Colors.white;
                          },
                        ),
                        cells: [
                          DataCell(Text(item['id'].toString())),
                          DataCell(Text(item['title'])),
                          DataCell(Text(item['userId'].toString())),
                          DataCell(Text(item['body'])),
                        ],
                      );
                    }).toList(),
                  ),
                );
              } else if (state is DataTableError) {
                return Center(child: Text(state.message));
              } else {
                return Center(child: Text('Unexpected State'));
              }
            },
          ),
        ),
        SizedBox(height: 10),
        BlocBuilder<DataTableCubit, DataTableState>(
          builder: (context, state) {
            if (state is DataTableLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed:
                        _currentPage > 1 ? () => _onPageChanged(1) : null,
                    child: Text('First'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _currentPage > 1
                        ? () => _onPageChanged(_currentPage - 1)
                        : null,
                    child: Text('Previous'),
                  ),
                  SizedBox(width: 20),
                  Text('Page $_currentPage of ${state.totalPages}'),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _currentPage < state.totalPages
                        ? () => _onPageChanged(_currentPage + 1)
                        : null,
                    child: Text('Next'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _currentPage < state.totalPages
                        ? () => _onPageChanged(state.totalPages)
                        : null,
                    child: Text('Last'),
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => DataTableCubit(),
        child: Scaffold(
          appBar: AppBar(title: Text('Responsive Data Table')),
          body: DataTableWidget(),
        ),
      ),
    );
  }
} */
/* import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Data Table Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataTablePage(),
    );
  }
}

class DataTablePage extends StatefulWidget {
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  List<dynamic> _data = [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoading = true;
  bool _hasError = false;

  final int _rowsPerPage = 10;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData({String query = ""}) async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?_page=$_currentPage&_limit=$_rowsPerPage&q=$query'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _data = data;
          _isLoading = false;
          _totalPages =
              (100 / _rowsPerPage).ceil(); // Dummy calculation for total pages
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  void _search() {
    _currentPage = 1;
    _fetchData(query: _searchController.text);
  }

  void _previousPage() {
    if (_currentPage > 1) {
      _currentPage--;
      _fetchData(query: _searchController.text);
    }
  }

  void _nextPage() {
    if (_currentPage < _totalPages) {
      _currentPage++;
      _fetchData(query: _searchController.text);
    }
  }

  void _jumpToPage(int page) {
    if (page >= 1 && page <= _totalPages) {
      _currentPage = page;
      _fetchData(query: _searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Data Table Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _search,
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _data.isEmpty
                    ? Center(child: Text('No Data'))
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Title')),
                            DataColumn(label: Text('Body')),
                          ],
                          rows: _data
                              .map((item) => DataRow(cells: [
                                    DataCell(Text(item['id'].toString())),
                                    DataCell(Text(item['title'])),
                                    DataCell(Text(item['body'])),
                                  ]))
                              .toList(),
                        ),
                      ),
          ),
          if (!_isLoading && _data.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Page $_currentPage of $_totalPages'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: _previousPage,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: _nextPage,
                      ),
                      Text('Go to page:'),
                      Container(
                        width: 50,
                        child: TextField(
                          onSubmitted: (value) {
                            final page = int.tryParse(value);
                            if (page != null) {
                              _jumpToPage(page);
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '1',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
} */
/*
 import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataTableDemo(),
    );
  }
}

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int currentPage = 1;
  int totalPages = 1;
  int pageSize = 10;
  String searchQuery = '';
  List<dynamic> data = [];
  bool isLoading = false;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });
    try {
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?_page=$currentPage&_limit=$pageSize&q=$searchQuery'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        setState(() {
          data = jsonData;
          // Assume the total number of items is 100 for demonstration
          totalPages = (100 / pageSize).ceil();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      setState(() {
        hasError = true;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void onSearch(String query) {
    setState(() {
      searchQuery = query;
      currentPage = 1;
    });
    fetchData();
  }

  void onPageChange(int page) {
    setState(() {
      currentPage = page;
    });
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table with Pagination and Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                onSearch(value);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : hasError
                      ? Center(child: Text('Failed to load data'))
                      : data.isEmpty
                          ? Center(child: Text('No data available'))
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('ID')),
                                  DataColumn(label: Text('Title')),
                                  DataColumn(label: Text('Body')),
                                ],
                                rows: data.map((item) {
                                  return DataRow(cells: [
                                    DataCell(Text(item['id'].toString())),
                                    DataCell(Text(item['title'])),
                                    DataCell(Text(item['body'])),
                                  ]);
                                }).toList(),
                              ),
                            ),
            ),
            SizedBox(height: 20),
            if (!isLoading && !hasError)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 1
                        ? () {
                            onPageChange(currentPage - 1);
                          }
                        : null,
                    child: Text('Previous'),
                  ),
                  Text('Page $currentPage of $totalPages'),
                  ElevatedButton(
                    onPressed: currentPage < totalPages
                        ? () {
                            onPageChange(currentPage + 1);
                          }
                        : null,
                    child: Text('Next'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
} 
*/
import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:ers_admin/config/environment.dart';
import 'package:ers_admin/ers_app.dart';

import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'export.dart';

void main() async {
  runZonedGuarded(
    /// Lock device orientation to portrait
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      await dependencyInjectorInit();
      EasyLocalization.logger.enableLevels = [];

      // Initialize Storage
      await GetStorage.init();
      const String environment = String.fromEnvironment(
        'ENVIRONMENT',
        defaultValue: Environment.dev,
      );

      Environment().initConfig(environment);
      setPathUrlStrategy();

      return SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
        ],
      ).then((_) => runApp(
            EasyLocalization(
              supportedLocales: const [
                Locale('en'),
              ],
              path: 'assets/langs',
              saveLocale: true,
              useFallbackTranslations: true,
              fallbackLocale: const Locale('en'),
              child: const EFSAdminApp(),
            ),
          ));
    },
    (error, stackTrace) async {
      log(error.toString());
      // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
