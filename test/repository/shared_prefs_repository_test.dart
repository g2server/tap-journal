import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_journal/models/journal_entry.dart';
import 'package:tap_journal/models/journal_entry_template.dart';
import 'package:tap_journal/repository/shared_prefs_repository.dart';

void main() {
  group('SharedPrefsRepository', () {
    test('addJournalEntry should add a journal entry to the repository',
        () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final repository = SharedPrefsRepository();
      await repository.init();

      var journalEntry =
          JournalEntry(title: 'Test', templateId: 0, entryDate: DateTime.now());

      // Act
      await repository.addJournalEntry(journalEntry);

      // Assert
      expect(await repository.getJournalEntries(), contains(journalEntry));
    });

    test('clear should remove all journal entries from the repository',
        () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final repository = SharedPrefsRepository();
      await repository.init();

      var journalEntry1 = JournalEntry(
          title: 'Test 1', templateId: 0, entryDate: DateTime.now());
      var journalEntry2 = JournalEntry(
          title: 'Test 2', templateId: 1, entryDate: DateTime.now());
      await repository.addJournalEntry(journalEntry1);
      await repository.addJournalEntry(journalEntry2);

      // Act
      await repository.clear();

      // Assert
      expect(await repository.getJournalEntries(), isEmpty);
    });

    test(
        'deleteJournalEntryTemplate should delete a journal entry template from the repository',
        () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final repository = SharedPrefsRepository();
      await repository.init();

      var journalEntryTemplate =
          const JournalEntryTemplate(id: 1, title: 'Template 1');

      // Add the journal entry template to the repository
      await repository.setJournalEntryTemplate(journalEntryTemplate);

      // Act
      await repository.deleteJournalEntryTemplate(journalEntryTemplate.id!);

      // Assert
      var templates = repository.getStream().value;
      expect(templates, isNot(contains(journalEntryTemplate)));
    });

    test('getJournalEntries should return a list of journal entries', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final repository = SharedPrefsRepository();
      await repository.init();

      var journalEntry1 = JournalEntry(
          title: 'Test 1', templateId: 0, entryDate: DateTime.now());
      var journalEntry2 = JournalEntry(
          title: 'Test 2', templateId: 1, entryDate: DateTime.now());
      await repository.addJournalEntry(journalEntry1);
      await repository.addJournalEntry(journalEntry2);

      // Act
      var entries = await repository.getJournalEntries();

      // Assert
      expect(entries, isList);
      expect(entries.length, equals(2));
      expect(entries, contains(journalEntry1));
      expect(entries, contains(journalEntry2));
    });

    test(
        'setJournalEntryTemplate should add a journal entry template to the repository',
        () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final repository = SharedPrefsRepository();
      await repository.init();

      var journalEntryTemplate =
          const JournalEntryTemplate(id: 1, title: 'Template 1');

      // Act
      await repository.setJournalEntryTemplate(journalEntryTemplate);

      // Assert
      var templates = repository.getStream().value;
      expect(templates, contains(journalEntryTemplate));
    });
  });
}
