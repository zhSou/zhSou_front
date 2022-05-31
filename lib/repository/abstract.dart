import 'entity.dart';

abstract class ASearcher {
  Future<SearchResponse> search(
    String query,
    int page, {
    int limit = 10,
  });
}
