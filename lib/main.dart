import 'package:flutter/material.dart';

import 'page/search/index.dart';
import 'repository/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Searcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(SearcherService()),
    );
  }
}
