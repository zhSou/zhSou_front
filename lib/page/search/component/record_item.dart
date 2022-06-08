import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zhsou/repository/entity.dart';

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
      leading: record.document.url.isEmpty
          ? null
          : Image.network(
              record.document.url,
              width: 90,
              errorBuilder: (
                BuildContext context,
                Object error,
                StackTrace? stackTrace,
              ) {
                return const SizedBox(width: 90);
              },
            ),
      title: HtmlWidget(record.text),
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
