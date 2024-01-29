// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalEntryTemplateImpl _$$JournalEntryTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalEntryTemplateImpl(
      title: json['title'] as String,
      id: json['id'] as int?,
      subtitle: json['subtitle'] as String?,
      latestEntryDateTime: json['latestEntryDateTime'] == null
          ? null
          : DateTime.parse(json['latestEntryDateTime'] as String),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$JournalEntryTemplateImplToJson(
        _$JournalEntryTemplateImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'subtitle': instance.subtitle,
      'latestEntryDateTime': instance.latestEntryDateTime?.toIso8601String(),
      'tags': instance.tags,
    };
