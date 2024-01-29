import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:tap_journal/app.dart';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tap_journal/repository/in_memory_repository.dart';
import 'package:tap_journal/repository/shared_prefs_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final repo = SharedPrefsRepository();

  await repo.init();
  //await repo.clear();
  await repo.seed();

  runApp(App(repo: repo));
}
