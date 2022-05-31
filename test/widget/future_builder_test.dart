import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zhsou/widget/future_builder.dart';

void main() {
  testWidgets(
    "MyFutureBuilder widget test",
    (WidgetTester tester) async {
      // 将我们的组件嵌入测试环境，并且触发一帧的渲染
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MyFutureBuilder<int>(
            future: () async {
              // 模拟等待三秒后返回数据
              await Future.delayed(const Duration(seconds: 2));
              return 1;
            }(),
            builder: (context, data) {
              return const Text('加载成功');
            },
          ),
        ),
      ));
      // 初始状态应当在转圈
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('加载成功'), findsNothing);
      await tester.pump(const Duration(seconds: 1));

      // 等一秒没渲染出来
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('加载成功'), findsNothing);
      await tester.pump(const Duration(seconds: 2));

      // 等完2s后组件渲染完毕
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('加载成功'), findsOneWidget);
    },
  );
}
