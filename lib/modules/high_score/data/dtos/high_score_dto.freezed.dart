// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'high_score_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HighScoreDto {

 int get score;
/// Create a copy of HighScoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HighScoreDtoCopyWith<HighScoreDto> get copyWith => _$HighScoreDtoCopyWithImpl<HighScoreDto>(this as HighScoreDto, _$identity);

  /// Serializes this HighScoreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HighScoreDto&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score);

@override
String toString() {
  return 'HighScoreDto(score: $score)';
}


}

/// @nodoc
abstract mixin class $HighScoreDtoCopyWith<$Res>  {
  factory $HighScoreDtoCopyWith(HighScoreDto value, $Res Function(HighScoreDto) _then) = _$HighScoreDtoCopyWithImpl;
@useResult
$Res call({
 int score
});




}
/// @nodoc
class _$HighScoreDtoCopyWithImpl<$Res>
    implements $HighScoreDtoCopyWith<$Res> {
  _$HighScoreDtoCopyWithImpl(this._self, this._then);

  final HighScoreDto _self;
  final $Res Function(HighScoreDto) _then;

/// Create a copy of HighScoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HighScoreDto].
extension HighScoreDtoPatterns on HighScoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HighScoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HighScoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HighScoreDto value)  $default,){
final _that = this;
switch (_that) {
case _HighScoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HighScoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _HighScoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HighScoreDto() when $default != null:
return $default(_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int score)  $default,) {final _that = this;
switch (_that) {
case _HighScoreDto():
return $default(_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int score)?  $default,) {final _that = this;
switch (_that) {
case _HighScoreDto() when $default != null:
return $default(_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HighScoreDto implements HighScoreDto {
  const _HighScoreDto({required this.score});
  factory _HighScoreDto.fromJson(Map<String, dynamic> json) => _$HighScoreDtoFromJson(json);

@override final  int score;

/// Create a copy of HighScoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HighScoreDtoCopyWith<_HighScoreDto> get copyWith => __$HighScoreDtoCopyWithImpl<_HighScoreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HighScoreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HighScoreDto&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score);

@override
String toString() {
  return 'HighScoreDto(score: $score)';
}


}

/// @nodoc
abstract mixin class _$HighScoreDtoCopyWith<$Res> implements $HighScoreDtoCopyWith<$Res> {
  factory _$HighScoreDtoCopyWith(_HighScoreDto value, $Res Function(_HighScoreDto) _then) = __$HighScoreDtoCopyWithImpl;
@override @useResult
$Res call({
 int score
});




}
/// @nodoc
class __$HighScoreDtoCopyWithImpl<$Res>
    implements _$HighScoreDtoCopyWith<$Res> {
  __$HighScoreDtoCopyWithImpl(this._self, this._then);

  final _HighScoreDto _self;
  final $Res Function(_HighScoreDto) _then;

/// Create a copy of HighScoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,}) {
  return _then(_HighScoreDto(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
