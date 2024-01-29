import 'dart:convert';

import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_journal/models/journal_entry.dart';
import 'package:tap_journal/models/journal_entry_template.dart';
import 'package:tap_journal/repository/repository.dart';
import 'package:tap_journal/repository/repository_mixin.dart';

/// A repository implementation that uses shared preferences for data storage.
/// It extends the [RepositoryMixin] class and implements the [Repository] interface.
class SharedPrefsRepository with RepositoryMixin implements Repository {
  final _subject = BehaviorSubject<List<JournalEntryTemplate>>.seeded([]);
  late SharedPreferences _prefs;
  final List<JournalEntryTemplate> _templates = [];

  static const String _entryKey = 'entry';
  static const String _templateKey = 'entry_template';
  static const String _templateMaxIdKey = 'entry_template_max_id';
  static const String _isFirstRun = 'is_first_run';

  @override

  /// Adds a journal entry to the shared preferences repository.
  Future<void> addJournalEntry(JournalEntry journalEntry) async {
    String json = jsonEncode(journalEntry.toJson());
    var list = _prefs.getStringList(_entryKey) ?? [];
    list.add(json);
    await _prefs.setStringList(_entryKey, list);
  }

  @override

  /// Sets the journal entry template.
  ///
  /// It creates a new template if the template id is null, and updates the template if the template id is not null.
  Future<void> setJournalEntryTemplate(
      JournalEntryTemplate journalEntryTemplate) async {
    if (journalEntryTemplate.id != null) {
      _templates
          .removeWhere((element) => element.id == journalEntryTemplate.id);
    } else {
      int lastId = _prefs.getInt(_templateMaxIdKey) ?? 0;
      lastId++;
      _prefs.setInt(_templateMaxIdKey, lastId);
      journalEntryTemplate = journalEntryTemplate.copyWith(id: lastId);
    }

    _templates.add(journalEntryTemplate);
    _templates.sort(mySortComparison);
    _subject.add(_templates);

    List<String> jsons =
        _templates.map((element) => jsonEncode(element.toJson())).toList();
    await _prefs.setStringList(_templateKey, jsons);
  }

  @override

  /// Deletes a journal entry template with the specified [id].
  ///
  /// This method is used to delete a journal entry template from the shared preferences repository.
  /// The [id] parameter specifies the unique identifier of the template to be deleted.
  Future<void> deleteJournalEntryTemplate(int id) async {
    _templates.removeWhere((element) => element.id == id);
    _subject.add(_templates);

    List<String> jsons =
        _templates.map((element) => jsonEncode(element.toJson())).toList();
    await _prefs.setStringList(_templateKey, jsons);
  }

  @override

  /// Returns a [BehaviorSubject] that emits a stream of [List<JournalEntryTemplate>].
  BehaviorSubject<List<JournalEntryTemplate>> getStream() {
    return _subject;
  }

  @override

  /// Initializes the shared preferences repository.
  /// This method should be called before using any other methods in the repository.
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    var jsons = _prefs.getStringList(_templateKey) ?? [];
    _templates.addAll(
        jsons.map((json) => JournalEntryTemplate.fromJson(jsonDecode(json))));
    _subject.add(_templates);
  }

  @override

  /// Retrieves a list of journal entries from the shared preferences repository asynchronously.
  Future<List<JournalEntry>> getJournalEntries() async {
    var list = _prefs.getStringList(_entryKey) ?? [];
    var entries =
        list.map((e) => JournalEntry.fromJson(jsonDecode(e))).toList();
    return entries;
  }

  @override

  /// This method clears all the data stored in the shared preferences.
  Future<void> clear() async {
    await _prefs.clear();
  }

  @override

  /// Seeds the repository with initial data.
  Future<void> seed() async {
    var result = await isFirstRun();
    if (result) {
      var mocks = createMockTemplates();
      for (var mock in mocks) {
        await setJournalEntryTemplate(mock);
      }
    }
  }

  @override

  /// Checks if the app is running for the first time.
  Future<bool> isFirstRun() async {
    bool? isFirstRun = _prefs.getBool(_isFirstRun);
    if (isFirstRun == null) {
      await _prefs.setBool(_isFirstRun, false);
      return true;
    }
    return false;
  }
}
