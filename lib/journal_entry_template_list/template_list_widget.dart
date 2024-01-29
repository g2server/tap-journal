import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_bloc.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_event.dart';
import 'package:tap_journal/journal_entry_template_list/template_list_view.dart';
import 'package:tap_journal/repository/repository.dart';

class TemplateListWidget extends StatelessWidget {
  const TemplateListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var repo = context.read<Repository>();

    return BlocProvider(
      create: (_) {
        return TemplateListBloc(repo)..add(const Init());
      },
      child: const TemplateListView(),
    );
  }
}
