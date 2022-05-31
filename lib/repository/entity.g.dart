// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document()
  ..url = json['url'] as String
  ..text = json['text'] as String;

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };

Record _$RecordFromJson(Map<String, dynamic> json) => Record()
  ..id = json['id'] as int
  ..text = json['text'] as String
  ..document = Document.fromJson(json['document'] as Map<String, dynamic>);

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'document': instance.document,
    };

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse()
      ..useTime = (json['useTime'] as num).toDouble()
      ..total = json['total'] as int
      ..page = json['page'] as int
      ..totalPage = json['totalPage'] as int
      ..records = (json['records'] as List<dynamic>)
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'useTime': instance.useTime,
      'total': instance.total,
      'page': instance.page,
      'totalPage': instance.totalPage,
      'records': instance.records,
    };
