import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_journal/forms/journal_entry_note_form.dart';
import 'package:tap_journal/journal_entry/bloc/entry_bloc.dart';
import 'package:tap_journal/journal_entry/bloc/entry_event.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_bloc.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_event.dart';
import 'package:tap_journal/models/journal_entry.dart';
import 'package:tap_journal/models/journal_entry_template.dart';

class EntryView extends StatelessWidget {
  const EntryView({super.key, required this.template});
  final JournalEntryTemplate template;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntryBloc, JournalEntry>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 1),
            Builder(
              builder: (context) {
                if (state.note != null) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(state.note!),
                        ),
                      ),
                      const Divider(height: 1),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
            _tagChips(state, context),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      var bloc = context.read<EntryBloc>();
                      var note = await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return JournalEntryNoteForm(note: state.note);
                        },
                      );
                      if (note != null && note.isNotEmpty) {
                        bloc.add(SetNote(note));
                      }
                    },
                    child: const Icon(Icons.edit_note),
                  ),
                  Container(),
                  _timeEdit(context, state),
                  Container(),
                  FilledButton(
                      onPressed: () {
                        var newTemplate = template.copyWith(
                            latestEntryDateTime: state.entryDate);
                        context.read<EntryBloc>().add(const SaveEntry());
                        context.read<TemplateListBloc>().add(
                              SetTemplate(template: newTemplate),
                            );
                      },
                      child: const Text('SAVE'))
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Row _timeEdit(BuildContext context, JournalEntry state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              context.read<EntryBloc>().add(const DecrementDate());
            },
            child: const Icon(Icons.remove)),
        Builder(builder: (context) {
          final tod = TimeOfDay.fromDateTime(state.entryDate);
          final localizations = MaterialLocalizations.of(context);
          final formattedTimeOfDay = localizations.formatTimeOfDay(tod);
          return Text(
            formattedTimeOfDay,
          );
        }),
        TextButton(
            onPressed: () {
              context.read<EntryBloc>().add(const IncrementDate());
            },
            child: const Icon(Icons.add)),
      ],
    );
  }

  Builder _tagChips(JournalEntry state, BuildContext context) {
    return Builder(
      builder: (_) {
        List<Widget> widgets = [];

        for (String tag in template.tags) {
          var filterChip = FilterChip(
            label: Text(tag),
            selected: state.tags.contains(tag),
            onSelected: (bool value) {
              if (value) {
                context.read<EntryBloc>().add(AddTag(tag));
              } else {
                context.read<EntryBloc>().add(RemoveTag(tag));
              }
            },
          );
          widgets.add(filterChip);
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(32, 12, 32, 8),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widgets,
          ),
        );
      },
    );
  }
}
