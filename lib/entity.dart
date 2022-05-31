import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

@JsonSerializable()
class Document {
  String url = '';
  String text = '';
  Document();
  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}

@JsonSerializable()
class Record {
  int id = 0;
  String text = '';
  Document document = Document();
  Record();
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

@JsonSerializable()
class SearchResponse {
  double useTime = 0;
  int total = 0;
  int page = 0;
  int totalPage = 0;
  List<Record> records = [];
  SearchResponse();
  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}
