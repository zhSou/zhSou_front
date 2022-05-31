import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// 这是一个计数器按钮组件，初始状态显示文本0，每当点击该按钮后其值+1
class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          _counter++;
        });
      },
      child: Text('$_counter'),
    );
  }
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 将我们的Counter组件嵌入测试环境，并且触发一帧的渲染
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Counter(),
      ),
    ));

    // 初始状态下，可以通过文本0找到内部的文本组件
    expect(find.text('0'), findsOneWidget);
    // 初始状态下，可以通过文本1找不到内部的文本组件
    expect(find.text('1'), findsNothing);

    // 寻找文本0的位置并且模拟点击触发
    await tester.tap(find.text('0'));
    // 再渲染一帧
    await tester.pump();

    // 此时按钮文本的数值应当+1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
