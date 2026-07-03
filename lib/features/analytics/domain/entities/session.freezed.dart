// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Session {

 String get sessionId; DateTime get startedAt; DateTime? get endedAt; int get totalForegroundDurationMs; int get totalBackgroundDurationMs; int get totalIdleDurationMs; bool get isActive;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.totalForegroundDurationMs, totalForegroundDurationMs) || other.totalForegroundDurationMs == totalForegroundDurationMs)&&(identical(other.totalBackgroundDurationMs, totalBackgroundDurationMs) || other.totalBackgroundDurationMs == totalBackgroundDurationMs)&&(identical(other.totalIdleDurationMs, totalIdleDurationMs) || other.totalIdleDurationMs == totalIdleDurationMs)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,startedAt,endedAt,totalForegroundDurationMs,totalBackgroundDurationMs,totalIdleDurationMs,isActive);

@override
String toString() {
  return 'Session(sessionId: $sessionId, startedAt: $startedAt, endedAt: $endedAt, totalForegroundDurationMs: $totalForegroundDurationMs, totalBackgroundDurationMs: $totalBackgroundDurationMs, totalIdleDurationMs: $totalIdleDurationMs, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
 String sessionId, DateTime startedAt, DateTime? endedAt, int totalForegroundDurationMs, int totalBackgroundDurationMs, int totalIdleDurationMs, bool isActive
});




}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? startedAt = null,Object? endedAt = freezed,Object? totalForegroundDurationMs = null,Object? totalBackgroundDurationMs = null,Object? totalIdleDurationMs = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalForegroundDurationMs: null == totalForegroundDurationMs ? _self.totalForegroundDurationMs : totalForegroundDurationMs // ignore: cast_nullable_to_non_nullable
as int,totalBackgroundDurationMs: null == totalBackgroundDurationMs ? _self.totalBackgroundDurationMs : totalBackgroundDurationMs // ignore: cast_nullable_to_non_nullable
as int,totalIdleDurationMs: null == totalIdleDurationMs ? _self.totalIdleDurationMs : totalIdleDurationMs // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Session value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Session value)  $default,){
final _that = this;
switch (_that) {
case _Session():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Session value)?  $default,){
final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  DateTime startedAt,  DateTime? endedAt,  int totalForegroundDurationMs,  int totalBackgroundDurationMs,  int totalIdleDurationMs,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.sessionId,_that.startedAt,_that.endedAt,_that.totalForegroundDurationMs,_that.totalBackgroundDurationMs,_that.totalIdleDurationMs,_that.isActive);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  DateTime startedAt,  DateTime? endedAt,  int totalForegroundDurationMs,  int totalBackgroundDurationMs,  int totalIdleDurationMs,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.sessionId,_that.startedAt,_that.endedAt,_that.totalForegroundDurationMs,_that.totalBackgroundDurationMs,_that.totalIdleDurationMs,_that.isActive);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  DateTime startedAt,  DateTime? endedAt,  int totalForegroundDurationMs,  int totalBackgroundDurationMs,  int totalIdleDurationMs,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.sessionId,_that.startedAt,_that.endedAt,_that.totalForegroundDurationMs,_that.totalBackgroundDurationMs,_that.totalIdleDurationMs,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Session implements Session {
  const _Session({required this.sessionId, required this.startedAt, this.endedAt, this.totalForegroundDurationMs = 0, this.totalBackgroundDurationMs = 0, this.totalIdleDurationMs = 0, required this.isActive});
  factory _Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

@override final  String sessionId;
@override final  DateTime startedAt;
@override final  DateTime? endedAt;
@override@JsonKey() final  int totalForegroundDurationMs;
@override@JsonKey() final  int totalBackgroundDurationMs;
@override@JsonKey() final  int totalIdleDurationMs;
@override final  bool isActive;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCopyWith<_Session> get copyWith => __$SessionCopyWithImpl<_Session>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.totalForegroundDurationMs, totalForegroundDurationMs) || other.totalForegroundDurationMs == totalForegroundDurationMs)&&(identical(other.totalBackgroundDurationMs, totalBackgroundDurationMs) || other.totalBackgroundDurationMs == totalBackgroundDurationMs)&&(identical(other.totalIdleDurationMs, totalIdleDurationMs) || other.totalIdleDurationMs == totalIdleDurationMs)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,startedAt,endedAt,totalForegroundDurationMs,totalBackgroundDurationMs,totalIdleDurationMs,isActive);

@override
String toString() {
  return 'Session(sessionId: $sessionId, startedAt: $startedAt, endedAt: $endedAt, totalForegroundDurationMs: $totalForegroundDurationMs, totalBackgroundDurationMs: $totalBackgroundDurationMs, totalIdleDurationMs: $totalIdleDurationMs, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, DateTime startedAt, DateTime? endedAt, int totalForegroundDurationMs, int totalBackgroundDurationMs, int totalIdleDurationMs, bool isActive
});




}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? startedAt = null,Object? endedAt = freezed,Object? totalForegroundDurationMs = null,Object? totalBackgroundDurationMs = null,Object? totalIdleDurationMs = null,Object? isActive = null,}) {
  return _then(_Session(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalForegroundDurationMs: null == totalForegroundDurationMs ? _self.totalForegroundDurationMs : totalForegroundDurationMs // ignore: cast_nullable_to_non_nullable
as int,totalBackgroundDurationMs: null == totalBackgroundDurationMs ? _self.totalBackgroundDurationMs : totalBackgroundDurationMs // ignore: cast_nullable_to_non_nullable
as int,totalIdleDurationMs: null == totalIdleDurationMs ? _self.totalIdleDurationMs : totalIdleDurationMs // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
