import 'package:bloc/bloc.dart';
import 'package:tap_journal/journal_entry/bloc/entry_event.dart';
import 'package:tap_journal/models/journal_entry.dart';
import 'package:tap_journal/models/journal_entry_template.dart';
import 'package:tap_journal/repository/repository.dart';

class EntryBloc extends Bloc<EntryEvent, JournalEntry> {
  final Repository _repo;
  final JournalEntryTemplate _template;

  EntryBloc(this._repo, this._template)
      : super(JournalEntry(
          title: _template.title,
          templateId: _template.id!,
          entryDate: DateTime.now(),
        )) {
    on<IncrementDate>(
      (event, emit) async {
        var entry = state.copyWith(
            entryDate: state.entryDate.add(
          const Duration(minutes: 1),
        ));
        emit(entry);
      },
    );

    on<DecrementDate>((event, emit) async {
      var entry = state.copyWith(
          entryDate: state.entryDate.add(
        const Duration(minutes: -30),
      ));
      emit(entry);
    });

    on<AddTag>(
      (event, emit) async {
        var entry = state.copyWith(tags: [...state.tags, event.tag]);
        emit(entry);
      },
    );

    on<RemoveTag>(
      (event, emit) async {
        var entry = state.copyWith(
          tags: state.tags.where((tag) => tag != event.tag).toList(),
        );
        emit(entry);
      },
    );

    on<SetNote>(
      (event, emit) async {
        var entry = state.copyWith(note: event.note);
        emit(entry);
      },
    );

    on<SaveEntry>(
      (event, emit) async {
        var entry = state.copyWith(
          templateId: _template.id!,
        );
        await _repo.addJournalEntry(entry);
        emit(entry);
      },
    );
  }
}
