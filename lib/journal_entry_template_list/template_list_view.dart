import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_bloc.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_state.dart';
import 'package:tap_journal/journal_entry_template/entry_template_widget.dart';
import 'package:tap_journal/journal_entry_template_list/template_list_view_app_bar.dart';

import 'package:tap_journal/forms/journal_entry_template_form.dart';

class TemplateListView extends StatelessWidget {
  const TemplateListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TemplateListBloc, TemplateListState>(
      listener: (BuildContext context, TemplateListState state) {
        if (state.status == TemplateListStateStatus.failure) {
          // TODO: show snackbar
        }
      },
      builder: (context, state) {
        if (state.status == TemplateListStateStatus.loading) {
          return const Scaffold(
            appBar: TemplateListViewAppBar(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.status == TemplateListStateStatus.success) {
          return Scaffold(
            appBar: const TemplateListViewAppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                child: ListView.builder(
                  itemCount: state.templates.length,
                  itemBuilder: (context, index) {
                    var journalEntryTemplate = state.templates[index];
                    return EntryTemplateItemWidget(
                      key: UniqueKey(),
                      journalEntryTemplate: journalEntryTemplate,
                    );
                  },
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                var bloc = context.read<TemplateListBloc>();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return JournalEntryTemplateForm(
                      bloc: bloc,
                    );
                  },
                );
              },
              tooltip: 'New Template',
              child: const Icon(Icons.add),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
