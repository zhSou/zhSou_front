import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zhsou/page/search/component/record_item.dart';
import 'package:zhsou/repository/entity.dart';

void main() {
  testWidgets(
    "RecordItemWidget test",
    (WidgetTester tester) async {
      // 将我们的组件嵌入测试环境，并且触发一帧的渲染
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RecordItemWidget(
            Record()
              ..id = 9876
              ..text = "测试标题",
          ),
        ),
      ));

      expect(find.text("测试标题"), findsOneWidget);
      expect(find.text("文档编号：9876"), findsOneWidget);
    },
  );
}
