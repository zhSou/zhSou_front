import 'package:flutter/material.dart';

class PageSwitcher extends StatelessWidget {
  final int currentPage;
  final int totalPage;
  final ValueChanged<int> onPageSwitch;

  const PageSwitcher({
    Key? key,
    required this.currentPage,
    required this.totalPage,
    required this.onPageSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed:
              currentPage <= 1 ? null : () => onPageSwitch(currentPage - 1),
          child: const Text('上一页'),
        ),
        Text('当前页$currentPage/总页数$totalPage'),
        TextButton(
          onPressed: currentPage >= totalPage
              ? null
              : () => onPageSwitch(currentPage + 1),
          child: const Text('下一页'),
        ),
      ],
    );
  }
}
