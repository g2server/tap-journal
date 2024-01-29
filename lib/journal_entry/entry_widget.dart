import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_journal/journal_entry/bloc/entry_bloc.dart';
import 'package:tap_journal/journal_entry/entry_view.dart';
import 'package:tap_journal/models/journal_entry_template.dart';
import 'package:tap_journal/repository/repository.dart';

class EntryWidget extends StatelessWidget {
  const EntryWidget({super.key, required this.template});
  final JournalEntryTemplate template;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var repo = context.read<Repository>();

        return EntryBloc(repo, template);
      },
      child: EntryView(
        template: template,
      ),
    );
  }
}
