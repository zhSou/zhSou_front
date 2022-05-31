import 'package:flutter_test/flutter_test.dart';
import 'package:zhsou/repository/abstract.dart';
import 'package:zhsou/repository/mock.dart';

void main() {
  test("test search api mock", () async {
    ASearcher searcher = SearcherMock();
    final response1 = await searcher.search("手机", 1);
    expect(response1.useTime, equals(0.007));
    expect(response1.page, equals(1));
    expect(response1.total, equals(20));
    expect(response1.totalPage, equals(2));
    expect(response1.records.length, equals(10));

    for (final record in response1.records) {
      expect(record.text, contains("手机"));
    }

    final response2 = await searcher.search("手机", 2);
    expect(response2.useTime, equals(0.0685073));
    expect(response2.page, equals(2));
    expect(response2.total, equals(20));
    expect(response2.totalPage, equals(2));
    expect(response2.records.length, equals(10));

    for (final record in response2.records) {
      expect(record.text, contains("手机"));
    }
  });
}
