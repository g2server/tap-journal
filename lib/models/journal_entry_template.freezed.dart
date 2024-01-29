// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_entry_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JournalEntryTemplate _$JournalEntryTemplateFromJson(Map<String, dynamic> json) {
  return _JournalEntryTemplate.fromJson(json);
}

/// @nodoc
mixin _$JournalEntryTemplate {
  String get title => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  DateTime? get latestEntryDateTime => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalEntryTemplateCopyWith<JournalEntryTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryTemplateCopyWith<$Res> {
  factory $JournalEntryTemplateCopyWith(JournalEntryTemplate value,
          $Res Function(JournalEntryTemplate) then) =
      _$JournalEntryTemplateCopyWithImpl<$Res, JournalEntryTemplate>;
  @useResult
  $Res call(
      {String title,
      int? id,
      String? subtitle,
      DateTime? latestEntryDateTime,
      List<String> tags});
}

/// @nodoc
class _$JournalEntryTemplateCopyWithImpl<$Res,
        $Val extends JournalEntryTemplate>
    implements $JournalEntryTemplateCopyWith<$Res> {
  _$JournalEntryTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? subtitle = freezed,
    Object? latestEntryDateTime = freezed,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      latestEntryDateTime: freezed == latestEntryDateTime
          ? _value.latestEntryDateTime
          : latestEntryDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalEntryTemplateImplCopyWith<$Res>
    implements $JournalEntryTemplateCopyWith<$Res> {
  factory _$$JournalEntryTemplateImplCopyWith(_$JournalEntryTemplateImpl value,
          $Res Function(_$JournalEntryTemplateImpl) then) =
      __$$JournalEntryTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      int? id,
      String? subtitle,
      DateTime? latestEntryDateTime,
      List<String> tags});
}

/// @nodoc
class __$$JournalEntryTemplateImplCopyWithImpl<$Res>
    extends _$JournalEntryTemplateCopyWithImpl<$Res, _$JournalEntryTemplateImpl>
    implements _$$JournalEntryTemplateImplCopyWith<$Res> {
  __$$JournalEntryTemplateImplCopyWithImpl(_$JournalEntryTemplateImpl _value,
      $Res Function(_$JournalEntryTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? subtitle = freezed,
    Object? latestEntryDateTime = freezed,
    Object? tags = null,
  }) {
    return _then(_$JournalEntryTemplateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      latestEntryDateTime: freezed == latestEntryDateTime
          ? _value.latestEntryDateTime
          : latestEntryDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalEntryTemplateImpl implements _JournalEntryTemplate {
  const _$JournalEntryTemplateImpl(
      {required this.title,
      this.id,
      this.subtitle,
      this.latestEntryDateTime,
      final List<String> tags = const []})
      : _tags = tags;

  factory _$JournalEntryTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEntryTemplateImplFromJson(json);

  @override
  final String title;
  @override
  final int? id;
  @override
  final String? subtitle;
  @override
  final DateTime? latestEntryDateTime;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'JournalEntryTemplate(title: $title, id: $id, subtitle: $subtitle, latestEntryDateTime: $latestEntryDateTime, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEntryTemplateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.latestEntryDateTime, latestEntryDateTime) ||
                other.latestEntryDateTime == latestEntryDateTime) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, id, subtitle,
      latestEntryDateTime, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEntryTemplateImplCopyWith<_$JournalEntryTemplateImpl>
      get copyWith =>
          __$$JournalEntryTemplateImplCopyWithImpl<_$JournalEntryTemplateImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEntryTemplateImplToJson(
      this,
    );
  }
}

abstract class _JournalEntryTemplate implements JournalEntryTemplate {
  const factory _JournalEntryTemplate(
      {required final String title,
      final int? id,
      final String? subtitle,
      final DateTime? latestEntryDateTime,
      final List<String> tags}) = _$JournalEntryTemplateImpl;

  factory _JournalEntryTemplate.fromJson(Map<String, dynamic> json) =
      _$JournalEntryTemplateImpl.fromJson;

  @override
  String get title;
  @override
  int? get id;
  @override
  String? get subtitle;
  @override
  DateTime? get latestEntryDateTime;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$JournalEntryTemplateImplCopyWith<_$JournalEntryTemplateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
