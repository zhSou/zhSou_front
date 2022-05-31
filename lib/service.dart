import 'package:dio/dio.dart';
import 'package:zhsou/abstract.dart';

import 'entity.dart';

class SearcherService implements ASearcher {
  @override
  Future<SearchResponse> search(
    String query,
    int page, {
    int limit = 10,
  }) async {
    final response = await Dio().post(
      "http://localhost:8001/query",
      data: {
        "query": query,
        "page": page,
        "limit": limit,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['code'] != 0) {
      throw Exception(data['msg']);
    }

    return SearchResponse.fromJson(data['data']);
  }
}
