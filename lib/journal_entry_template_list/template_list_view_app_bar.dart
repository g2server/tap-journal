import 'dart:convert' show utf8;
//import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_journal/repository/repository.dart';

class TemplateListViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TemplateListViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Tap Journal'),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded),
            onSelected: (String result) {
              handleClick(result, context);
            },
            itemBuilder: (BuildContext context) {
              return {'Export'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ),
      ],
    );
  }

  void handleClick(String value, BuildContext context) async {
    var repo = context.read<Repository>();
    var entries = await repo.getJournalEntries();
    List<List<dynamic>> data = entries.map((entry) {
      return [entry.entryDate, entry.title, entry.tags, entry.note ?? ''];
    }).toList();
    String csv = const ListToCsvConverter().convert(data);

    if (value == 'Export' && kIsWeb) {
      saveTextFile(csv, 'journal.csv');
    }
  }

  void saveTextFile(String text, String filename) {
    // http.
    //   ..href =
    //       '${Uri.dataFromString(text, mimeType: 'text/plain', encoding: utf8)}'
    //   ..download = filename
    //   ..style.display = 'none'
    //   ..click();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
