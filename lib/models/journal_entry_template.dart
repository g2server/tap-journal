import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_entry_template.freezed.dart';
part 'journal_entry_template.g.dart';

@freezed
class JournalEntryTemplate with _$JournalEntryTemplate {
  const factory JournalEntryTemplate({
    required String title,
    int? id,
    String? subtitle,
    DateTime? latestEntryDateTime,
    @Default([]) List<String> tags,
  }) = _JournalEntryTemplate;

  factory JournalEntryTemplate.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryTemplateFromJson(json);
}
