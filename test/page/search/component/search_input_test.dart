import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zhsou/page/search/component/search_input.dart';

void main() {
  testWidgets(
    "SearchInputWidget test",
    (WidgetTester tester) async {
      String? inputContent;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SearchInputWidget(
            startText: '手机',
            callback: (e) => inputContent = e,
          ),
        ),
      ));

      await tester.pump(const Duration(seconds: 1));

      // 基本页面元素获取
      final textEditor = find.text('手机');
      expect(textEditor, findsOneWidget);

      final searchBtn = find.byIcon(Icons.search);
      expect(searchBtn, findsOneWidget);

      // 模拟点击文本输入框，输入文字测试文本，检测是否能找到
      await tester.tap(textEditor);
      tester.testTextInput.enterText("测试文本");
      expect(find.text('测试文本'), findsOneWidget);

      // 然后测试是否能触发callback回调
      expect(inputContent, equals(null));
      await tester.tap(searchBtn);
      expect(inputContent, equals("测试文本"));
    },
  );
}
