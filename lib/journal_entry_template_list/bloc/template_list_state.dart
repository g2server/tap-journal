import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tap_journal/models/journal_entry_template.dart';

part 'template_list_state.freezed.dart';

enum TemplateListStateStatus { initial, loading, success, failure }

@freezed
class TemplateListState with _$TemplateListState {
  const factory TemplateListState({
    @Default(TemplateListStateStatus.initial) TemplateListStateStatus status,
    @Default([]) List<JournalEntryTemplate> templates,
  }) = _TemplateListState;
}
