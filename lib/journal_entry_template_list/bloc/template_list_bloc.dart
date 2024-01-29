import 'package:bloc/bloc.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_event.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_state.dart';
import 'package:tap_journal/models/journal_entry_template.dart';
import 'package:tap_journal/repository/repository.dart';

class TemplateListBloc extends Bloc<TemplateListEvent, TemplateListState> {
  final Repository _repo;

  TemplateListBloc(this._repo) : super(const TemplateListState()) {
    on<Init>((event, emit) async {
      emit(
        state.copyWith(status: TemplateListStateStatus.loading),
      );

      await emit.forEach<List<JournalEntryTemplate>>(
        _repo.getStream(),
        onData: (templates) {
          return state.copyWith(
            status: TemplateListStateStatus.success,
            templates: templates,
          );
        },
        onError: (_, __) {
          return state.copyWith(
            status: TemplateListStateStatus.failure,
          );
        },
      );
    });

    on<SetTemplate>((event, emit) async {
      emit(state.copyWith(status: TemplateListStateStatus.loading));
      await Future.delayed(const Duration(milliseconds: 200));
      await _repo.setJournalEntryTemplate(event.template);
      emit(state.copyWith(status: TemplateListStateStatus.success));
    });

    on<DeleteTemplate>((event, emit) async {
      emit(state.copyWith(status: TemplateListStateStatus.loading));
      await Future.delayed(const Duration(milliseconds: 200));
      await _repo.deleteJournalEntryTemplate(event.id);
      emit(state.copyWith(status: TemplateListStateStatus.success));
    });
  }
}
