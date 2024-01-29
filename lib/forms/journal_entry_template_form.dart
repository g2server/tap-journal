import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_bloc.dart';
import 'package:tap_journal/journal_entry_template_list/bloc/template_list_event.dart';
import 'package:tap_journal/models/journal_entry_template.dart';

class JournalEntryTemplateForm extends StatefulWidget {
  const JournalEntryTemplateForm({
    super.key,
    this.template,
    required this.bloc,
  });

  final JournalEntryTemplate? template;
  final TemplateListBloc bloc;

  @override
  State<JournalEntryTemplateForm> createState() =>
      _JournalEntryTemplateFormState();
}

class _JournalEntryTemplateFormState extends State<JournalEntryTemplateForm> {
  final _mainFormKey = GlobalKey<FormBuilderState>();
  final _tagFormKey = GlobalKey<FormBuilderState>();
  int? _templateId;
  String _initialTitle = '';
  String _initialSubtitle = '';
  List<String>? _tags = [];

  @override
  void initState() {
    super.initState();
    if (widget.template != null) {
      _initialTitle = widget.template?.title ?? '';
      _initialSubtitle = widget.template?.subtitle ?? '';
      _tags = widget.template?.tags.toList() ?? [];
      _templateId = widget.template?.id;
    }
  }

  @override
  void dispose() {
    _mainFormKey.currentState?.dispose();
    _tagFormKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: _templateId == null
          ? const Text('New Template')
          : const Text('Edit Template'),
      content: SizedBox(
        child: Center(
          child: Column(
            children: [
              FormBuilder(
                key: _mainFormKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      initialValue: _initialTitle,
                      autofocus: true,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.required(),
                      name: 'title',
                    ),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      initialValue: _initialSubtitle,
                      decoration: const InputDecoration(
                        labelText: 'Subtitle',
                        border: OutlineInputBorder(),
                      ),
                      name: 'subtitle',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FormBuilder(
                key: _tagFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            decoration: const InputDecoration(
                              labelText: 'Tag',
                              border: OutlineInputBorder(),
                            ),
                            validator: FormBuilderValidators.required(),
                            name: 'tag',
                          ),
                        ),
                        const SizedBox(width: 16),
                        FilledButton(
                          onPressed: _addTag,
                          child: const Text('ADD'),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Builder(builder: _buildTagChips),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CANCEL'),
            ),
            FilledButton(
              onPressed: _saveTemplate,
              child: const Text('SAVE'),
            ),
          ],
        )
      ],
    );
  }

  void _addTag() {
    var result = _tagFormKey.currentState?.saveAndValidate();
    if (result ?? false) {
      var tag = _tagFormKey.currentState?.fields['tag'];
      var val = tag?.value;
      tag?.reset();
      tag?.focus();
      if (val.toString().isNotEmpty) {
        setState(() {
          _tags?.add(val);
        });
      }
    }
  }

  Widget _buildTagChips(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _tags!.map((tag) {
        return Chip(
          label: Text(tag),
          onDeleted: () {
            setState(() {
              _tags?.remove(tag);
            });
          },
        );
      }).toList(),
    );
  }

  void _saveTemplate() {
    var result = _mainFormKey.currentState?.saveAndValidate() ?? false;
    if (result) {
      var journalEntryTemplate = JournalEntryTemplate(
        id: _templateId,
        title: _mainFormKey.currentState?.fields['title']?.value,
        subtitle: _mainFormKey.currentState?.fields['subtitle']?.value,
        tags: _tags ?? [],
      );
      widget.bloc.add(SetTemplate(template: journalEntryTemplate));
      Navigator.of(context).pop();
    }
  }
}
