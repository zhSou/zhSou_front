import 'package:dio/dio.dart';
import 'package:zhsou/config.dart';

import 'abstract.dart';
import 'entity.dart';

class SearcherService implements ASearcher {
  @override
  Future<SearchResponse> search(
    String query,
    int page, {
    int limit = 10,
  }) async {
    final response = await Dio().post(
      "${Config.server}/query",
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
