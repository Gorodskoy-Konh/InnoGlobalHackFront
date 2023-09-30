// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Worker _$WorkerFromJson(Map<String, dynamic> json) {
  return _Worker.fromJson(json);
}

/// @nodoc
mixin _$Worker {
  String get id => throw _privateConstructorUsedError;
  List<(int, int)> get workingSchedule => throw _privateConstructorUsedError;
  List<Stack> get stack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkerCopyWith<Worker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerCopyWith<$Res> {
  factory $WorkerCopyWith(Worker value, $Res Function(Worker) then) =
      _$WorkerCopyWithImpl<$Res, Worker>;
  @useResult
  $Res call({String id, List<(int, int)> workingSchedule, List<Stack> stack});
}

/// @nodoc
class _$WorkerCopyWithImpl<$Res, $Val extends Worker>
    implements $WorkerCopyWith<$Res> {
  _$WorkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workingSchedule = null,
    Object? stack = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workingSchedule: null == workingSchedule
          ? _value.workingSchedule
          : workingSchedule // ignore: cast_nullable_to_non_nullable
              as List<(int, int)>,
      stack: null == stack
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as List<Stack>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkerImplCopyWith<$Res> implements $WorkerCopyWith<$Res> {
  factory _$$WorkerImplCopyWith(
          _$WorkerImpl value, $Res Function(_$WorkerImpl) then) =
      __$$WorkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<(int, int)> workingSchedule, List<Stack> stack});
}

/// @nodoc
class __$$WorkerImplCopyWithImpl<$Res>
    extends _$WorkerCopyWithImpl<$Res, _$WorkerImpl>
    implements _$$WorkerImplCopyWith<$Res> {
  __$$WorkerImplCopyWithImpl(
      _$WorkerImpl _value, $Res Function(_$WorkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workingSchedule = null,
    Object? stack = null,
  }) {
    return _then(_$WorkerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workingSchedule: null == workingSchedule
          ? _value._workingSchedule
          : workingSchedule // ignore: cast_nullable_to_non_nullable
              as List<(int, int)>,
      stack: null == stack
          ? _value._stack
          : stack // ignore: cast_nullable_to_non_nullable
              as List<Stack>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkerImpl implements _Worker {
  const _$WorkerImpl(
      {required this.id,
      required final List<(int, int)> workingSchedule,
      required final List<Stack> stack})
      : _workingSchedule = workingSchedule,
        _stack = stack;

  factory _$WorkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerImplFromJson(json);

  @override
  final String id;
  final List<(int, int)> _workingSchedule;
  @override
  List<(int, int)> get workingSchedule {
    if (_workingSchedule is EqualUnmodifiableListView) return _workingSchedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workingSchedule);
  }

  final List<Stack> _stack;
  @override
  List<Stack> get stack {
    if (_stack is EqualUnmodifiableListView) return _stack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stack);
  }

  @override
  String toString() {
    return 'Worker(id: $id, workingSchedule: $workingSchedule, stack: $stack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._workingSchedule, _workingSchedule) &&
            const DeepCollectionEquality().equals(other._stack, _stack));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_workingSchedule),
      const DeepCollectionEquality().hash(_stack));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      __$$WorkerImplCopyWithImpl<_$WorkerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerImplToJson(
      this,
    );
  }
}

abstract class _Worker implements Worker {
  const factory _Worker(
      {required final String id,
      required final List<(int, int)> workingSchedule,
      required final List<Stack> stack}) = _$WorkerImpl;

  factory _Worker.fromJson(Map<String, dynamic> json) = _$WorkerImpl.fromJson;

  @override
  String get id;
  @override
  List<(int, int)> get workingSchedule;
  @override
  List<Stack> get stack;
  @override
  @JsonKey(ignore: true)
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
