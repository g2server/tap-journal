import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class JournalEntryNoteForm extends StatelessWidget {
  const JournalEntryNoteForm({Key? key, required this.note}) : super(key: key);
  final String? note;

  @override
  Widget build(BuildContext context) {
    final mainFormKey = GlobalKey<FormBuilderState>();

    return AlertDialog(
      scrollable: true,
      title: const Text('Entry note'),
      content: Center(
        child: FormBuilder(
          key: mainFormKey,
          child: FormBuilderTextField(
            autofocus: true,
            initialValue: note ?? '',
            name: 'note',
            decoration: const InputDecoration(
              labelText: 'Note',
              border: OutlineInputBorder(),
            ),
            validator: FormBuilderValidators.required(),
            maxLines: 10,
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
            ElevatedButton(
              onPressed: () {
                var isValid =
                    mainFormKey.currentState?.saveAndValidate() ?? false;
                if (isValid) {
                  String note = mainFormKey.currentState?.fields['note']?.value;
                  Navigator.of(context).pop(note);
                }
              },
              child: const Text('SAVE'),
            ),
          ],
        )
      ],
    );
  }
}
