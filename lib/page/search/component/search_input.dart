import 'package:flutter/material.dart';

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
