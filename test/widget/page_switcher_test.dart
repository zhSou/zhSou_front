import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zhsou/widget/page_switcher.dart';

void main() {
  testWidgets(
    'PageSwitcher widget on first page test',
    (WidgetTester tester) async {
      int? switchToPage;
      // 将我们的组件嵌入测试环境，并且触发一帧的渲染
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PageSwitcher(
            currentPage: 1,
            totalPage: 10,
            // 被点击后置变量的值为将要跳转的页面号
            onPageSwitch: (p) => switchToPage = p,
          ),
        ),
      ));

      final lastBtn = find.text('上一页');
      expect(lastBtn, findsOneWidget);

      final nextBtn = find.text('下一页');
      expect(nextBtn, findsOneWidget);

      final centerText = find.text('当前页1/总页数10');
      expect(centerText, findsOneWidget);

      // 第一页状态下上一页应当点不动，故回调函数不会改变变量switchToPage
      await tester.tap(lastBtn);
      await tester.pump(); // 刷新一帧
      expect(switchToPage, equals(null));

      // 点击下一页就能点动了，此时switchToPage将变更为下一页的页号
      await tester.tap(nextBtn);
      await tester.pump(); // 刷新一帧
      expect(switchToPage, equals(2));
    },
  );

  testWidgets(
    'PageSwitcher widget on finally page test',
    (WidgetTester tester) async {
      int? switchToPage;
      // 将我们的组件嵌入测试环境，并且触发一帧的渲染
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PageSwitcher(
            currentPage: 10,
            totalPage: 10,
            // 被点击后置变量的值为将要跳转的页面号
            onPageSwitch: (p) => switchToPage = p,
          ),
        ),
      ));

      final lastBtn = find.text('上一页');
      expect(lastBtn, findsOneWidget);

      final nextBtn = find.text('下一页');
      expect(nextBtn, findsOneWidget);

      final centerText = find.text('当前页10/总页数10');
      expect(centerText, findsOneWidget);

      // 最后一页状态下下一页应当点不动，故回调函数不会改变变量switchToPage
      await tester.tap(nextBtn);
      await tester.pump(); // 刷新一帧
      expect(switchToPage, equals(null));

      // 点击上一页就能点动了，此时switchToPage将变更为下一页的页号
      await tester.tap(lastBtn);
      await tester.pump(); // 刷新一帧
      expect(switchToPage, equals(9));
    },
  );
}
