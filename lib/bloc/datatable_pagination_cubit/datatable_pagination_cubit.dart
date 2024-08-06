import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../export.dart';

part 'datatable_pagination_cubit_state.dart';

class PaginationCubit<T> extends Cubit<PaginationState<T>> {
  PaginationCubit() : super(PaginationInitial());

  final int pageSize = 5;

  void fetchData({
    required String apiUrl,
    required int page,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? queryParameters,
  }) async {
    emit(PaginationLoading());

    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: {
      ...?queryParameters,
      '_page': page.toString(),
      '_limit': pageSize.toString(),
    });

    final response = await http.get(uri);
    await Future.delayed(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final int totalItems = int.parse(response.headers['x-total-count'] ??
          '100'); // Assuming a total count is provided in the headers
      final int totalPages = (totalItems / pageSize).ceil();
      final List<T> items = data.map((json) => fromJson(json)).toList();

      emit(PaginationLoaded<T>(items, page, totalPages));
    } else {
      emit(PaginationError('Failed to fetch data'));
    }
  }
}
