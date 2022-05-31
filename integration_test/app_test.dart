import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:zhsou/page/search/component/search_input.dart';
import 'package:zhsou/page/search/index.dart';
import 'package:zhsou/repository/mock.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('test app', (tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'Searcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(SearcherMock()),
    ));
    final inputArea = find.byType(SearchInputWidget);
    final searchBtn = find.byIcon(Icons.search);

    expect(find.text('上一页'), findsNothing);
    expect(find.text('下一页'), findsNothing);
    // 点击输入框
    await tester.tap(inputArea);
    await tester.pump(const Duration(seconds: 1));

    // 输入手机
    tester.testTextInput.enterText('手机');
    await tester.pump();

    // 点击搜索按钮
    await tester.tap(searchBtn);
    await tester.pump(const Duration(seconds: 1));

    // 搜索到结果应当能够找到上一页，下一页按钮
    final lastBtn = find.text('上一页');
    final nextBtn = find.text('下一页');
    expect(lastBtn, findsOneWidget);
    expect(nextBtn, findsOneWidget);

    // 查看结果页是否展示正确
    String firstPageText = '【华为手机】华为手机价格,价格查询,华为手机怎么样?';
    String secondPageText = '壁纸 夜景 1100_1390 竖版 竖屏 手机';
    // 定位页面元素
    expect(find.text(firstPageText), findsOneWidget);
    expect(find.text(secondPageText), findsNothing);

    await tester.tap(nextBtn);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(firstPageText), findsNothing);
    expect(find.text(secondPageText), findsOneWidget);

    await tester.tap(lastBtn);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(firstPageText), findsOneWidget);
    expect(find.text(secondPageText), findsNothing);

    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(seconds: 1));
  });
}
