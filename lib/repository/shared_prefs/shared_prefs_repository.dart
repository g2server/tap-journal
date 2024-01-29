import 'dart:convert';

import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_journal/models/journal_entry.dart';
import 'package:tap_journal/models/journal_entry_template.dart';
import 'package:tap_journal/repository/repository.dart';

class SharedPrefsRepository implements Repository {
  final _subject = BehaviorSubject<List<JournalEntryTemplate>>.seeded([]);
  late SharedPreferences _prefs;
  final List<JournalEntryTemplate> _templates = [];

  static const String _entryKey = 'entry';
  static const String _templateKey = 'entry_template';
  static const String _templateMaxIdKey = 'entry_template_max_id';
  static const String _isFirstRun = 'is_first_run';

  @override
  Future<void> addJournalEntry(JournalEntry journalEntry) async {
    String json = jsonEncode(journalEntry.toJson());
    var list = _prefs.getStringList(_entryKey) ?? [];
    list.add(json);
    await _prefs.setStringList(_entryKey, list);
  }

  @override
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
  Future<void> deleteJournalEntryTemplate(int id) async {
    _templates.removeWhere((element) => element.id == id);
    _subject.add(_templates);

    List<String> jsons =
        _templates.map((element) => jsonEncode(element.toJson())).toList();
    await _prefs.setStringList(_templateKey, jsons);
  }

  @override
  Stream<List<JournalEntryTemplate>> getStream() {
    return _subject.asBroadcastStream();
  }

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    var jsons = _prefs.getStringList(_templateKey) ?? [];
    _templates.addAll(
        jsons.map((json) => JournalEntryTemplate.fromJson(jsonDecode(json))));
    _subject.add(_templates);
  }

  int mySortComparison(JournalEntryTemplate a, JournalEntryTemplate b) {
    return (b.latestEntryDateTime ?? DateTime(0))
        .compareTo(a.latestEntryDateTime ?? DateTime(0));
  }

  @override
  Future<List<JournalEntry>> getJournalEntries() async {
    var list = _prefs.getStringList(_entryKey) ?? [];
    var entries =
        list.map((e) => JournalEntry.fromJson(jsonDecode(e))).toList();
    return entries;
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }

  @override
  Future<void> seed() async {
    var result = await isFirstRun();
    if (result) {
      var template1 = const JournalEntryTemplate(
          title: 'Make the bed', tags: ['quickly', 'properly']);
      await setJournalEntryTemplate(template1);

      var template2 = const JournalEntryTemplate(
          title: 'Stretching', tags: ['5m', '10m', 'back', 'legs', 'arms']);
      await setJournalEntryTemplate(template2);
    }
  }

  @override
  Future<bool> isFirstRun() async {
    bool? isFirstRun = _prefs.getBool(_isFirstRun);
    if (isFirstRun == null) {
      await _prefs.setBool(_isFirstRun, false);
      return true;
    }
    return false;
  }
}
