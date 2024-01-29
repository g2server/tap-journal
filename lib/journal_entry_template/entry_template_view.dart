import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tap_journal/forms/confirm_form.dart';
import 'package:tap_journal/journal_entry/entry_widget.dart';
import 'package:tap_journal/journal_entry_template/cubit/entry_template_cubit.dart';
import 'package:tap_journal/forms/journal_entry_template_form.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_bloc.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_event.dart';
import 'package:tap_journal/models/journal_entry_template.dart';
import 'package:timeago/timeago.dart' as timeago;

class EntryTemplateView extends StatelessWidget {
  const EntryTemplateView({super.key, required this.journalEntryTemplate});

  final JournalEntryTemplate journalEntryTemplate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntryTemplateCubit, bool>(
      builder: (context, state) {
        return Card(
          elevation: 4,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
                title: Builder(builder: (context) {
                  var editAction = SlidableAction(
                    onPressed: (context) {
                      var bloc = context.read<TemplateListBloc>();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return JournalEntryTemplateForm(
                            bloc: bloc,
                            template: journalEntryTemplate,
                          );
                        },
                      );
                    },
                    backgroundColor: Colors.transparent,
                    foregroundColor: Theme.of(context).primaryColor,
                    icon: Icons.edit,
                  );
                  var deleteAction = SlidableAction(
                    onPressed: (context) async {
                      var bloc = context.read<TemplateListBloc>();
                      var result = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return const ConfirmForm(
                            prompt:
                                'Are you sure you want to delete this template?',
                          );
                        },
                      );

                      if (result == true) {
                        bloc.add(DeleteTemplate(id: journalEntryTemplate.id!));
                      }
                    },
                    backgroundColor: Colors.transparent,
                    foregroundColor: Theme.of(context).primaryColor,
                    icon: Icons.delete,
                  );
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        editAction,
                        deleteAction,
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        deleteAction,
                        editAction,
                      ],
                    ),
                    child: Column(
                      children: [
                        Builder(builder: (context) {
                          Widget? subtitle;
                          if (journalEntryTemplate.subtitle != null &&
                              journalEntryTemplate.subtitle!.isNotEmpty) {
                            subtitle = Text(
                              journalEntryTemplate.subtitle!,
                            );
                          }
                          return ListTile(
                            title: Text(journalEntryTemplate.title),
                            subtitle: subtitle,
                          );
                        }),
                        Builder(builder: (context) {
                          String dateString = '';
                          if (journalEntryTemplate.latestEntryDateTime !=
                              null) {
                            dateString = timeago.format(
                                journalEntryTemplate.latestEntryDateTime!);
                          }
                          if (dateString.isEmpty) {
                            return Container();
                          } else {
                            return Row(
                              children: [
                                const SizedBox(width: 16),
                                const Icon(
                                  Icons.access_time,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  dateString,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            );
                          }
                        })
                      ],
                    ),
                  );
                }),
                children: [
                  Builder(builder: (_) {
                    if (!state) {
                      return EntryWidget(template: journalEntryTemplate);
                    }
                    return const Text('');
                  })
                ]),
          ),
        );
      },
    );
  }
}
