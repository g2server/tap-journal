// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalEntryImpl _$$JournalEntryImplFromJson(Map<String, dynamic> json) =>
    _$JournalEntryImpl(
      title: json['title'] as String,
      templateId: json['templateId'] as int,
      entryDate: DateTime.parse(json['entryDate'] as String),
      note: json['note'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$JournalEntryImplToJson(_$JournalEntryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'templateId': instance.templateId,
      'entryDate': instance.entryDate.toIso8601String(),
      'note': instance.note,
      'tags': instance.tags,
    };
