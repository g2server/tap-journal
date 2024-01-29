// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TemplateListState {
  TemplateListStateStatus get status => throw _privateConstructorUsedError;
  List<JournalEntryTemplate> get templates =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateListStateCopyWith<TemplateListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateListStateCopyWith<$Res> {
  factory $TemplateListStateCopyWith(
          TemplateListState value, $Res Function(TemplateListState) then) =
      _$TemplateListStateCopyWithImpl<$Res, TemplateListState>;
  @useResult
  $Res call(
      {TemplateListStateStatus status, List<JournalEntryTemplate> templates});
}

/// @nodoc
class _$TemplateListStateCopyWithImpl<$Res, $Val extends TemplateListState>
    implements $TemplateListStateCopyWith<$Res> {
  _$TemplateListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? templates = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TemplateListStateStatus,
      templates: null == templates
          ? _value.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<JournalEntryTemplate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateListStateImplCopyWith<$Res>
    implements $TemplateListStateCopyWith<$Res> {
  factory _$$TemplateListStateImplCopyWith(_$TemplateListStateImpl value,
          $Res Function(_$TemplateListStateImpl) then) =
      __$$TemplateListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TemplateListStateStatus status, List<JournalEntryTemplate> templates});
}

/// @nodoc
class __$$TemplateListStateImplCopyWithImpl<$Res>
    extends _$TemplateListStateCopyWithImpl<$Res, _$TemplateListStateImpl>
    implements _$$TemplateListStateImplCopyWith<$Res> {
  __$$TemplateListStateImplCopyWithImpl(_$TemplateListStateImpl _value,
      $Res Function(_$TemplateListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? templates = null,
  }) {
    return _then(_$TemplateListStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TemplateListStateStatus,
      templates: null == templates
          ? _value._templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<JournalEntryTemplate>,
    ));
  }
}

/// @nodoc

class _$TemplateListStateImpl implements _TemplateListState {
  const _$TemplateListStateImpl(
      {this.status = TemplateListStateStatus.initial,
      final List<JournalEntryTemplate> templates = const []})
      : _templates = templates;

  @override
  @JsonKey()
  final TemplateListStateStatus status;
  final List<JournalEntryTemplate> _templates;
  @override
  @JsonKey()
  List<JournalEntryTemplate> get templates {
    if (_templates is EqualUnmodifiableListView) return _templates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templates);
  }

  @override
  String toString() {
    return 'TemplateListState(status: $status, templates: $templates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateListStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._templates, _templates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_templates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateListStateImplCopyWith<_$TemplateListStateImpl> get copyWith =>
      __$$TemplateListStateImplCopyWithImpl<_$TemplateListStateImpl>(
          this, _$identity);
}

abstract class _TemplateListState implements TemplateListState {
  const factory _TemplateListState(
      {final TemplateListStateStatus status,
      final List<JournalEntryTemplate> templates}) = _$TemplateListStateImpl;

  @override
  TemplateListStateStatus get status;
  @override
  List<JournalEntryTemplate> get templates;
  @override
  @JsonKey(ignore: true)
  _$$TemplateListStateImplCopyWith<_$TemplateListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
