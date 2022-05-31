import 'package:flutter_test/flutter_test.dart';
import 'package:zhsou/repository/abstract.dart';
import 'package:zhsou/repository/service.dart';

void main() {
  test(
    "test search api",
    () async {
      ASearcher searcher = SearcherService();
      final response = await searcher.search("手机", 1);

      expect(
        response.useTime,
        allOf(
          greaterThanOrEqualTo(0),
          lessThan(1),
        ),
      );
      expect(response.page, equals(1));
      expect(response.total, equals(2280));
      expect(response.totalPage, equals(228));
      expect(response.records.length, equals(10));

      for (final record in response.records) {
        expect(record.text, contains("手机"));
      }
    },
    timeout: const Timeout(Duration(milliseconds: 100)),
  );
}
