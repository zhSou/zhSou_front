import 'package:flutter/material.dart';
import 'package:zhsou/repository/abstract.dart';
import 'package:zhsou/repository/entity.dart';
import 'package:zhsou/widget/future_builder.dart';
import 'package:zhsou/widget/page_switcher.dart';

import 'component/search_input.dart';
import 'component/search_result.dart';

class SearchBodyWidget extends StatefulWidget {
  final ASearcher searcher;
  const SearchBodyWidget(this.searcher, {Key? key}) : super(key: key);

  @override
  State<SearchBodyWidget> createState() => _SearchBodyWidgetState();
}

class _SearchBodyWidgetState extends State<SearchBodyWidget> {
  String query = '';
  int pageId = 1;
  int limitSize = 100;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchInputWidget(
          startText: query,
          callback: (val) async {
            setState(() {
              query = val;
            });
          },
        ),
        Expanded(
          child: MyFutureBuilder<SearchResponse>(
            future: widget.searcher.search(
              query,
              pageId,
              limit: limitSize,
            ),
            builder: (BuildContext context, data) {
              return Column(
                children: [
                  Expanded(child: SearchResultWidget(data)),
                  if (data.total != 0)
                    PageSwitcher(
                      currentPage: data.page,
                      totalPage: data.totalPage,
                      onPageSwitch: (int value) {
                        setState(() {
                          pageId = value;
                        });
                      },
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class SearchPage extends StatelessWidget {
  final ASearcher searcher;
  const SearchPage(this.searcher, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索引擎"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SearchBodyWidget(searcher),
      ),
    );
  }
}
