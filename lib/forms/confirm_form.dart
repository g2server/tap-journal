import 'package:flutter/material.dart';

class ConfirmForm extends StatelessWidget {
  const ConfirmForm({Key? key, required this.prompt}) : super(key: key);
  final String prompt;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm'),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(prompt),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('CANCEL'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        ),
      ],
    );
  }
}
