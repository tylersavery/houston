class PaginatedResponse<T> {
  final int page;
  final int count;
  final int numPages;
  final int limit;
  final List<T> results;

  PaginatedResponse({
    required this.page,
    required this.count,
    required this.numPages,
    required this.limit,
    required this.results,
  });

  factory PaginatedResponse.empty() {
    return PaginatedResponse(
      page: 0,
      count: 0,
      numPages: 0,
      limit: 0,
      results: [],
    );
  }

  bool get canLoadMore {
    return page * limit < count;
  }
}
