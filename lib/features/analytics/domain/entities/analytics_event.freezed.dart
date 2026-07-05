// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsEvent {

 String get eventId; String get sessionId; String get installationId; String? get userId; DateTime get timestamp; DateTime get deviceTime; String get timezone; String? get screenName; EventType get eventType; Map<String, dynamic> get metadata; String get appVersion; String get buildNumber; String get platform; String get osVersion; String get deviceModel; String? get manufacturer; String? get screenResolution; String? get deviceOrientation; String get locale; String get networkType; int? get batteryLevel;
/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsEventCopyWith<AnalyticsEvent> get copyWith => _$AnalyticsEventCopyWithImpl<AnalyticsEvent>(this as AnalyticsEvent, _$identity);

  /// Serializes this AnalyticsEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsEvent&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.installationId, installationId) || other.installationId == installationId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.deviceTime, deviceTime) || other.deviceTime == deviceTime)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.screenName, screenName) || other.screenName == screenName)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.screenResolution, screenResolution) || other.screenResolution == screenResolution)&&(identical(other.deviceOrientation, deviceOrientation) || other.deviceOrientation == deviceOrientation)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.networkType, networkType) || other.networkType == networkType)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,eventId,sessionId,installationId,userId,timestamp,deviceTime,timezone,screenName,eventType,const DeepCollectionEquality().hash(metadata),appVersion,buildNumber,platform,osVersion,deviceModel,manufacturer,screenResolution,deviceOrientation,locale,networkType,batteryLevel]);

@override
String toString() {
  return 'AnalyticsEvent(eventId: $eventId, sessionId: $sessionId, installationId: $installationId, userId: $userId, timestamp: $timestamp, deviceTime: $deviceTime, timezone: $timezone, screenName: $screenName, eventType: $eventType, metadata: $metadata, appVersion: $appVersion, buildNumber: $buildNumber, platform: $platform, osVersion: $osVersion, deviceModel: $deviceModel, manufacturer: $manufacturer, screenResolution: $screenResolution, deviceOrientation: $deviceOrientation, locale: $locale, networkType: $networkType, batteryLevel: $batteryLevel)';
}


}

/// @nodoc
abstract mixin class $AnalyticsEventCopyWith<$Res>  {
  factory $AnalyticsEventCopyWith(AnalyticsEvent value, $Res Function(AnalyticsEvent) _then) = _$AnalyticsEventCopyWithImpl;
@useResult
$Res call({
 String eventId, String sessionId, String installationId, String? userId, DateTime timestamp, DateTime deviceTime, String timezone, String? screenName, EventType eventType, Map<String, dynamic> metadata, String appVersion, String buildNumber, String platform, String osVersion, String deviceModel, String? manufacturer, String? screenResolution, String? deviceOrientation, String locale, String networkType, int? batteryLevel
});




}
/// @nodoc
class _$AnalyticsEventCopyWithImpl<$Res>
    implements $AnalyticsEventCopyWith<$Res> {
  _$AnalyticsEventCopyWithImpl(this._self, this._then);

  final AnalyticsEvent _self;
  final $Res Function(AnalyticsEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eventId = null,Object? sessionId = null,Object? installationId = null,Object? userId = freezed,Object? timestamp = null,Object? deviceTime = null,Object? timezone = null,Object? screenName = freezed,Object? eventType = null,Object? metadata = null,Object? appVersion = null,Object? buildNumber = null,Object? platform = null,Object? osVersion = null,Object? deviceModel = null,Object? manufacturer = freezed,Object? screenResolution = freezed,Object? deviceOrientation = freezed,Object? locale = null,Object? networkType = null,Object? batteryLevel = freezed,}) {
  return _then(_self.copyWith(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,installationId: null == installationId ? _self.installationId : installationId // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,deviceTime: null == deviceTime ? _self.deviceTime : deviceTime // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,screenName: freezed == screenName ? _self.screenName : screenName // ignore: cast_nullable_to_non_nullable
as String?,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as EventType,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String?,screenResolution: freezed == screenResolution ? _self.screenResolution : screenResolution // ignore: cast_nullable_to_non_nullable
as String?,deviceOrientation: freezed == deviceOrientation ? _self.deviceOrientation : deviceOrientation // ignore: cast_nullable_to_non_nullable
as String?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,networkType: null == networkType ? _self.networkType : networkType // ignore: cast_nullable_to_non_nullable
as String,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsEvent].
extension AnalyticsEventPatterns on AnalyticsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsEvent value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsEvent value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String eventId,  String sessionId,  String installationId,  String? userId,  DateTime timestamp,  DateTime deviceTime,  String timezone,  String? screenName,  EventType eventType,  Map<String, dynamic> metadata,  String appVersion,  String buildNumber,  String platform,  String osVersion,  String deviceModel,  String? manufacturer,  String? screenResolution,  String? deviceOrientation,  String locale,  String networkType,  int? batteryLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsEvent() when $default != null:
return $default(_that.eventId,_that.sessionId,_that.installationId,_that.userId,_that.timestamp,_that.deviceTime,_that.timezone,_that.screenName,_that.eventType,_that.metadata,_that.appVersion,_that.buildNumber,_that.platform,_that.osVersion,_that.deviceModel,_that.manufacturer,_that.screenResolution,_that.deviceOrientation,_that.locale,_that.networkType,_that.batteryLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String eventId,  String sessionId,  String installationId,  String? userId,  DateTime timestamp,  DateTime deviceTime,  String timezone,  String? screenName,  EventType eventType,  Map<String, dynamic> metadata,  String appVersion,  String buildNumber,  String platform,  String osVersion,  String deviceModel,  String? manufacturer,  String? screenResolution,  String? deviceOrientation,  String locale,  String networkType,  int? batteryLevel)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsEvent():
return $default(_that.eventId,_that.sessionId,_that.installationId,_that.userId,_that.timestamp,_that.deviceTime,_that.timezone,_that.screenName,_that.eventType,_that.metadata,_that.appVersion,_that.buildNumber,_that.platform,_that.osVersion,_that.deviceModel,_that.manufacturer,_that.screenResolution,_that.deviceOrientation,_that.locale,_that.networkType,_that.batteryLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String eventId,  String sessionId,  String installationId,  String? userId,  DateTime timestamp,  DateTime deviceTime,  String timezone,  String? screenName,  EventType eventType,  Map<String, dynamic> metadata,  String appVersion,  String buildNumber,  String platform,  String osVersion,  String deviceModel,  String? manufacturer,  String? screenResolution,  String? deviceOrientation,  String locale,  String networkType,  int? batteryLevel)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsEvent() when $default != null:
return $default(_that.eventId,_that.sessionId,_that.installationId,_that.userId,_that.timestamp,_that.deviceTime,_that.timezone,_that.screenName,_that.eventType,_that.metadata,_that.appVersion,_that.buildNumber,_that.platform,_that.osVersion,_that.deviceModel,_that.manufacturer,_that.screenResolution,_that.deviceOrientation,_that.locale,_that.networkType,_that.batteryLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsEvent implements AnalyticsEvent {
  const _AnalyticsEvent({required this.eventId, required this.sessionId, required this.installationId, this.userId, required this.timestamp, required this.deviceTime, required this.timezone, this.screenName, required this.eventType, final  Map<String, dynamic> metadata = const {}, required this.appVersion, required this.buildNumber, required this.platform, required this.osVersion, required this.deviceModel, this.manufacturer, this.screenResolution, this.deviceOrientation, required this.locale, required this.networkType, this.batteryLevel}): _metadata = metadata;
  factory _AnalyticsEvent.fromJson(Map<String, dynamic> json) => _$AnalyticsEventFromJson(json);

@override final  String eventId;
@override final  String sessionId;
@override final  String installationId;
@override final  String? userId;
@override final  DateTime timestamp;
@override final  DateTime deviceTime;
@override final  String timezone;
@override final  String? screenName;
@override final  EventType eventType;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

@override final  String appVersion;
@override final  String buildNumber;
@override final  String platform;
@override final  String osVersion;
@override final  String deviceModel;
@override final  String? manufacturer;
@override final  String? screenResolution;
@override final  String? deviceOrientation;
@override final  String locale;
@override final  String networkType;
@override final  int? batteryLevel;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsEventCopyWith<_AnalyticsEvent> get copyWith => __$AnalyticsEventCopyWithImpl<_AnalyticsEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsEvent&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.installationId, installationId) || other.installationId == installationId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.deviceTime, deviceTime) || other.deviceTime == deviceTime)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.screenName, screenName) || other.screenName == screenName)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.screenResolution, screenResolution) || other.screenResolution == screenResolution)&&(identical(other.deviceOrientation, deviceOrientation) || other.deviceOrientation == deviceOrientation)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.networkType, networkType) || other.networkType == networkType)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,eventId,sessionId,installationId,userId,timestamp,deviceTime,timezone,screenName,eventType,const DeepCollectionEquality().hash(_metadata),appVersion,buildNumber,platform,osVersion,deviceModel,manufacturer,screenResolution,deviceOrientation,locale,networkType,batteryLevel]);

@override
String toString() {
  return 'AnalyticsEvent(eventId: $eventId, sessionId: $sessionId, installationId: $installationId, userId: $userId, timestamp: $timestamp, deviceTime: $deviceTime, timezone: $timezone, screenName: $screenName, eventType: $eventType, metadata: $metadata, appVersion: $appVersion, buildNumber: $buildNumber, platform: $platform, osVersion: $osVersion, deviceModel: $deviceModel, manufacturer: $manufacturer, screenResolution: $screenResolution, deviceOrientation: $deviceOrientation, locale: $locale, networkType: $networkType, batteryLevel: $batteryLevel)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory _$AnalyticsEventCopyWith(_AnalyticsEvent value, $Res Function(_AnalyticsEvent) _then) = __$AnalyticsEventCopyWithImpl;
@override @useResult
$Res call({
 String eventId, String sessionId, String installationId, String? userId, DateTime timestamp, DateTime deviceTime, String timezone, String? screenName, EventType eventType, Map<String, dynamic> metadata, String appVersion, String buildNumber, String platform, String osVersion, String deviceModel, String? manufacturer, String? screenResolution, String? deviceOrientation, String locale, String networkType, int? batteryLevel
});




}
/// @nodoc
class __$AnalyticsEventCopyWithImpl<$Res>
    implements _$AnalyticsEventCopyWith<$Res> {
  __$AnalyticsEventCopyWithImpl(this._self, this._then);

  final _AnalyticsEvent _self;
  final $Res Function(_AnalyticsEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? sessionId = null,Object? installationId = null,Object? userId = freezed,Object? timestamp = null,Object? deviceTime = null,Object? timezone = null,Object? screenName = freezed,Object? eventType = null,Object? metadata = null,Object? appVersion = null,Object? buildNumber = null,Object? platform = null,Object? osVersion = null,Object? deviceModel = null,Object? manufacturer = freezed,Object? screenResolution = freezed,Object? deviceOrientation = freezed,Object? locale = null,Object? networkType = null,Object? batteryLevel = freezed,}) {
  return _then(_AnalyticsEvent(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,installationId: null == installationId ? _self.installationId : installationId // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,deviceTime: null == deviceTime ? _self.deviceTime : deviceTime // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,screenName: freezed == screenName ? _self.screenName : screenName // ignore: cast_nullable_to_non_nullable
as String?,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as EventType,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String?,screenResolution: freezed == screenResolution ? _self.screenResolution : screenResolution // ignore: cast_nullable_to_non_nullable
as String?,deviceOrientation: freezed == deviceOrientation ? _self.deviceOrientation : deviceOrientation // ignore: cast_nullable_to_non_nullable
as String?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,networkType: null == networkType ? _self.networkType : networkType // ignore: cast_nullable_to_non_nullable
as String,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
