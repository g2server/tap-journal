import 'package:rxdart/subjects.dart';
import 'package:tap_journal/models/journal_entry.dart';
import 'package:tap_journal/models/journal_entry_template.dart';
import 'package:tap_journal/repository/repository.dart';
import 'package:tap_journal/repository/repository_mixin.dart';

class InMemoryRepository with RepositoryMixin implements Repository {
  final List<JournalEntry> _journalEntries = [];
  final _subject = BehaviorSubject<List<JournalEntryTemplate>>.seeded([]);
  final List<JournalEntryTemplate> _templates = [];
  var _isFirstRun = true;
  int _autoId = 0;

  @override
  Future<void> addJournalEntry(JournalEntry journalEntry) {
    _journalEntries.add(journalEntry);
    return Future.value();
  }

  @override
  Future<void> clear() {
    _journalEntries.clear();
    return Future.value();
  }

  @override
  Future<void> deleteJournalEntryTemplate(int id) {
    _templates.removeWhere((element) => element.id == id);
    _subject.add(_templates);
    return Future.value();
  }

  @override
  Future<List<JournalEntry>> getJournalEntries() {
    return Future.value(_journalEntries);
  }

  @override
  BehaviorSubject<List<JournalEntryTemplate>> getStream() {
    return _subject;
  }

  @override
  Future<void> init() {
    return Future.value();
  }

  @override
  Future<bool> isFirstRun() {
    if (_isFirstRun) {
      _isFirstRun = false;
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<void> seed() async {
    var result = await isFirstRun();
    if (result) {
      var mocks = createMockTemplates();
      for (var mock in mocks) {
        setJournalEntryTemplate(mock);
      }
    }
    return Future.value();
  }

  @override
  Future<void> setJournalEntryTemplate(
      JournalEntryTemplate journalEntryTemplate) {
    if (journalEntryTemplate.id != null) {
      _templates
          .removeWhere((element) => element.id == journalEntryTemplate.id);
    } else {
      _autoId++;
      journalEntryTemplate = journalEntryTemplate.copyWith(id: _autoId);
    }

    _templates.add(journalEntryTemplate);
    _templates.sort(mySortComparison);
    _subject.add(_templates);
    return Future.value();
  }
}
