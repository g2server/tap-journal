import 'package:bloc/bloc.dart';

class EntryTemplateCubit extends Cubit<bool> {
  EntryTemplateCubit() : super(false);

  void toggleExpanded() {
    emit(!state);
  }
}
