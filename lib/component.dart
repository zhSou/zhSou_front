import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'entity.dart';

Future<void> showRecordDetailDialog(BuildContext context, Record record) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("文档编号：${record.id}"),
        content: Text(
          "文档编号：${record.id}\n"
          "文档文字描述：${record.text}\n"
          "文档url：${record.document.url}",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('关闭对话框'),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
    },
  );
}

class RecordItemWidget extends StatelessWidget {
  final Record record;
  const RecordItemWidget(this.record, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        record.document.url,
        width: 90,
      ),
      title: Text(record.text),
      subtitle: Text('文档编号：${record.id}'),
      trailing: IconButton(
        icon: const Icon(Icons.open_in_browser),
        onPressed: () {
          launchUrl(Uri.parse(record.document.url));
        },
      ),
      onTap: () {
        showRecordDetailDialog(context, record);
      },
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  final SearchResponse searchResponse;
  const SearchResultWidget(this.searchResponse, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            '搜索完毕，搜索结果数：${searchResponse.total}，搜索用时：${searchResponse.useTime}'),
        Expanded(
          child: ListView(
            children: searchResponse.records.map(
              (e) {
                return Column(
                  children: [
                    RecordItemWidget(e),
                    const Divider(),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

class SearchInputWidget extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final ValueChanged<String>? callback;
  final String? startText;
  SearchInputWidget({Key? key, this.callback, this.startText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (startText != null) {
      Future.delayed(Duration.zero, () {
        controller.text = startText!;
      });
    }
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(hintText: "请输入搜索关键字"),
            controller: controller,
            onSubmitted: (String val) {
              if (callback != null) callback!(val);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            if (callback != null) callback!(controller.text);
          },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}

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
