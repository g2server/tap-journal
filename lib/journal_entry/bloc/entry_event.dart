import 'package:equatable/equatable.dart';

sealed class EntryEvent extends Equatable {
  const EntryEvent();

  @override
  List<Object> get props => [];
}

final class SaveEntry extends EntryEvent {
  const SaveEntry();
}

final class IncrementDate extends EntryEvent {
  const IncrementDate();
}

final class DecrementDate extends EntryEvent {
  const DecrementDate();
}

final class SetNote extends EntryEvent {
  const SetNote(this.note);
  final String note;
}

final class AddTag extends EntryEvent {
  const AddTag(this.tag);
  final String tag;
}

final class RemoveTag extends EntryEvent {
  const RemoveTag(this.tag);
  final String tag;
}
