import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_journal/journal_entry_template/cubit/entry_template_cubit.dart';
import 'package:tap_journal/journal_entry_template/entry_template_view.dart';
import 'package:tap_journal/models/journal_entry_template.dart';

class EntryTemplateItemWidget extends StatelessWidget {
  const EntryTemplateItemWidget({
    super.key,
    required this.journalEntryTemplate,
  });
  final JournalEntryTemplate journalEntryTemplate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return EntryTemplateCubit();
        },
        child: EntryTemplateView(
          journalEntryTemplate: journalEntryTemplate,
        ));
  }
}
