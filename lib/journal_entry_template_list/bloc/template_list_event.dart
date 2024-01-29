import 'package:equatable/equatable.dart';
import 'package:tap_journal/models/journal_entry_template.dart';

sealed class TemplateListEvent extends Equatable {
  const TemplateListEvent();

  @override
  List<Object> get props => [];
}

final class Init extends TemplateListEvent {
  const Init();
}

final class SetTemplate extends TemplateListEvent {
  const SetTemplate({
    required this.template,
  });

  final JournalEntryTemplate template;
}

final class DeleteTemplate extends TemplateListEvent {
  const DeleteTemplate({
    required this.id,
  });

  final int id;
}
