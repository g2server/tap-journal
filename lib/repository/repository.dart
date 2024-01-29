import 'package:tap_journal/models/journal_entry.dart';
import 'package:tap_journal/models/journal_entry_template.dart';

abstract class Repository {
  Repository();

  Future<void> init();

  Future<void> seed();

  Future<void> clear();

  Future<void> deleteJournalEntryTemplate(int id);

  Future<void> setJournalEntryTemplate(
      JournalEntryTemplate journalEntryTemplate);

  Future<void> addJournalEntry(JournalEntry journalEntry);

  Future<List<JournalEntry>> getJournalEntries();

  Stream<List<JournalEntryTemplate>> getStream();

  Future<bool> isFirstRun();
}
