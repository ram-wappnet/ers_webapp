part of 'datatable_pagination_cubit.dart';

abstract class PaginationState<T> {}

class PaginationInitial<T> extends PaginationState<T> {}

class PaginationLoading<T> extends PaginationState<T> {}

class PaginationLoaded<T> extends PaginationState<T> {
  final List<T> data;
  final int currentPage;
  final int totalPages;

  PaginationLoaded(this.data, this.currentPage, this.totalPages);
}

class PaginationError<T> extends PaginationState<T> {
  final String message;

  PaginationError(this.message);
}
