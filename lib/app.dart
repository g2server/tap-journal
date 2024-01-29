import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_journal/journal_entry_template_list/template_list_widget.dart';
import 'package:tap_journal/repository/repository.dart';
import 'package:tap_journal/shared/responsive_center.dart';
import 'package:tap_journal/theme/color_schemes.g.dart';

class App extends StatelessWidget {
  const App({
    required this.repo,
    super.key,
  });

  final Repository repo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Repository>.value(
      value: repo,
      child: MaterialApp(
        home: const ResponsiveCenter(child: TemplateListWidget()),
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      ),
    );
  }
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    //log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    //log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
