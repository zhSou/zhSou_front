import 'package:flutter/material.dart';
import 'package:zhsou/repository/entity.dart';

import 'record_item.dart';

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
