// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tempo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TempoModel _$TempoModelFromJson(Map<String, dynamic> json) {
  return _TempoModel.fromJson(json);
}

/// @nodoc
mixin _$TempoModel {
  int get groupNumber => throw _privateConstructorUsedError;
  String get soundPath => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  List<GroupElement> get elements => throw _privateConstructorUsedError;

  /// Serializes this TempoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TempoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TempoModelCopyWith<TempoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempoModelCopyWith<$Res> {
  factory $TempoModelCopyWith(
          TempoModel value, $Res Function(TempoModel) then) =
      _$TempoModelCopyWithImpl<$Res, TempoModel>;
  @useResult
  $Res call(
      {int groupNumber,
      String soundPath,
      String imagePath,
      List<GroupElement> elements});
}

/// @nodoc
class _$TempoModelCopyWithImpl<$Res, $Val extends TempoModel>
    implements $TempoModelCopyWith<$Res> {
  _$TempoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TempoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupNumber = null,
    Object? soundPath = null,
    Object? imagePath = null,
    Object? elements = null,
  }) {
    return _then(_value.copyWith(
      groupNumber: null == groupNumber
          ? _value.groupNumber
          : groupNumber // ignore: cast_nullable_to_non_nullable
              as int,
      soundPath: null == soundPath
          ? _value.soundPath
          : soundPath // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<GroupElement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TempoModelImplCopyWith<$Res>
    implements $TempoModelCopyWith<$Res> {
  factory _$$TempoModelImplCopyWith(
          _$TempoModelImpl value, $Res Function(_$TempoModelImpl) then) =
      __$$TempoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int groupNumber,
      String soundPath,
      String imagePath,
      List<GroupElement> elements});
}

/// @nodoc
class __$$TempoModelImplCopyWithImpl<$Res>
    extends _$TempoModelCopyWithImpl<$Res, _$TempoModelImpl>
    implements _$$TempoModelImplCopyWith<$Res> {
  __$$TempoModelImplCopyWithImpl(
      _$TempoModelImpl _value, $Res Function(_$TempoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TempoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupNumber = null,
    Object? soundPath = null,
    Object? imagePath = null,
    Object? elements = null,
  }) {
    return _then(_$TempoModelImpl(
      groupNumber: null == groupNumber
          ? _value.groupNumber
          : groupNumber // ignore: cast_nullable_to_non_nullable
              as int,
      soundPath: null == soundPath
          ? _value.soundPath
          : soundPath // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      elements: null == elements
          ? _value._elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<GroupElement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TempoModelImpl implements _TempoModel {
  const _$TempoModelImpl(
      {this.groupNumber = 0,
      this.soundPath = 'assets/sounds/ambient_c_motion.mp3',
      this.imagePath = 'path/to/default/image',
      final List<GroupElement> elements = const <GroupElement>[]})
      : _elements = elements;

  factory _$TempoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TempoModelImplFromJson(json);

  @override
  @JsonKey()
  final int groupNumber;
  @override
  @JsonKey()
  final String soundPath;
  @override
  @JsonKey()
  final String imagePath;
  final List<GroupElement> _elements;
  @override
  @JsonKey()
  List<GroupElement> get elements {
    if (_elements is EqualUnmodifiableListView) return _elements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_elements);
  }

  @override
  String toString() {
    return 'TempoModel(groupNumber: $groupNumber, soundPath: $soundPath, imagePath: $imagePath, elements: $elements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TempoModelImpl &&
            (identical(other.groupNumber, groupNumber) ||
                other.groupNumber == groupNumber) &&
            (identical(other.soundPath, soundPath) ||
                other.soundPath == soundPath) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality().equals(other._elements, _elements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupNumber, soundPath,
      imagePath, const DeepCollectionEquality().hash(_elements));

  /// Create a copy of TempoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TempoModelImplCopyWith<_$TempoModelImpl> get copyWith =>
      __$$TempoModelImplCopyWithImpl<_$TempoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TempoModelImplToJson(
      this,
    );
  }
}

abstract class _TempoModel implements TempoModel {
  const factory _TempoModel(
      {final int groupNumber,
      final String soundPath,
      final String imagePath,
      final List<GroupElement> elements}) = _$TempoModelImpl;

  factory _TempoModel.fromJson(Map<String, dynamic> json) =
      _$TempoModelImpl.fromJson;

  @override
  int get groupNumber;
  @override
  String get soundPath;
  @override
  String get imagePath;
  @override
  List<GroupElement> get elements;

  /// Create a copy of TempoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TempoModelImplCopyWith<_$TempoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupElement _$GroupElementFromJson(Map<String, dynamic> json) {
  return _GroupElement.fromJson(json);
}

/// @nodoc
mixin _$GroupElement {
  int get id => throw _privateConstructorUsedError;
  String get sound => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError; // 기본 볼륨을 100으로 설정
  int get bpm => throw _privateConstructorUsedError;

  /// Serializes this GroupElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupElementCopyWith<GroupElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupElementCopyWith<$Res> {
  factory $GroupElementCopyWith(
          GroupElement value, $Res Function(GroupElement) then) =
      _$GroupElementCopyWithImpl<$Res, GroupElement>;
  @useResult
  $Res call({int id, String sound, int volume, int bpm});
}

/// @nodoc
class _$GroupElementCopyWithImpl<$Res, $Val extends GroupElement>
    implements $GroupElementCopyWith<$Res> {
  _$GroupElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sound = null,
    Object? volume = null,
    Object? bpm = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sound: null == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      bpm: null == bpm
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupElementImplCopyWith<$Res>
    implements $GroupElementCopyWith<$Res> {
  factory _$$GroupElementImplCopyWith(
          _$GroupElementImpl value, $Res Function(_$GroupElementImpl) then) =
      __$$GroupElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String sound, int volume, int bpm});
}

/// @nodoc
class __$$GroupElementImplCopyWithImpl<$Res>
    extends _$GroupElementCopyWithImpl<$Res, _$GroupElementImpl>
    implements _$$GroupElementImplCopyWith<$Res> {
  __$$GroupElementImplCopyWithImpl(
      _$GroupElementImpl _value, $Res Function(_$GroupElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sound = null,
    Object? volume = null,
    Object? bpm = null,
  }) {
    return _then(_$GroupElementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sound: null == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      bpm: null == bpm
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupElementImpl implements _GroupElement {
  const _$GroupElementImpl(
      {required this.id, required this.sound, this.volume = 50, this.bpm = 60});

  factory _$GroupElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupElementImplFromJson(json);

  @override
  final int id;
  @override
  final String sound;
  @override
  @JsonKey()
  final int volume;
// 기본 볼륨을 100으로 설정
  @override
  @JsonKey()
  final int bpm;

  @override
  String toString() {
    return 'GroupElement(id: $id, sound: $sound, volume: $volume, bpm: $bpm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.bpm, bpm) || other.bpm == bpm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sound, volume, bpm);

  /// Create a copy of GroupElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupElementImplCopyWith<_$GroupElementImpl> get copyWith =>
      __$$GroupElementImplCopyWithImpl<_$GroupElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupElementImplToJson(
      this,
    );
  }
}

abstract class _GroupElement implements GroupElement {
  const factory _GroupElement(
      {required final int id,
      required final String sound,
      final int volume,
      final int bpm}) = _$GroupElementImpl;

  factory _GroupElement.fromJson(Map<String, dynamic> json) =
      _$GroupElementImpl.fromJson;

  @override
  int get id;
  @override
  String get sound;
  @override
  int get volume; // 기본 볼륨을 100으로 설정
  @override
  int get bpm;

  /// Create a copy of GroupElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupElementImplCopyWith<_$GroupElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
