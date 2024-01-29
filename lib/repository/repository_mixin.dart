import 'package:tap_journal/models/journal_entry_template.dart';

mixin RepositoryMixin {
  int mySortComparison(JournalEntryTemplate a, JournalEntryTemplate b) {
    return (b.latestEntryDateTime ?? DateTime(0))
        .compareTo(a.latestEntryDateTime ?? DateTime(0));
  }

  List<JournalEntryTemplate> createMockTemplates() {
    return [
      const JournalEntryTemplate(
          title: 'Make the bed', tags: ['quickly', 'properly']),
      const JournalEntryTemplate(
          title: 'Stretching', tags: ['5m', '10m', 'back', 'legs', 'arms']),
    ];
  }
}
