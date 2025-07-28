// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoNote implements DiagnosticableTreeMixin {

 String get id; String get title; String get desc; String get imagePath;
/// Create a copy of PhotoNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoNoteCopyWith<PhotoNote> get copyWith => _$PhotoNoteCopyWithImpl<PhotoNote>(this as PhotoNote, _$identity);

  /// Serializes this PhotoNote to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PhotoNote'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('desc', desc))..add(DiagnosticsProperty('imagePath', imagePath));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoNote&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,desc,imagePath);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PhotoNote(id: $id, title: $title, desc: $desc, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $PhotoNoteCopyWith<$Res>  {
  factory $PhotoNoteCopyWith(PhotoNote value, $Res Function(PhotoNote) _then) = _$PhotoNoteCopyWithImpl;
@useResult
$Res call({
 String id, String title, String desc, String imagePath
});




}
/// @nodoc
class _$PhotoNoteCopyWithImpl<$Res>
    implements $PhotoNoteCopyWith<$Res> {
  _$PhotoNoteCopyWithImpl(this._self, this._then);

  final PhotoNote _self;
  final $Res Function(PhotoNote) _then;

/// Create a copy of PhotoNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? desc = null,Object? imagePath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoNote].
extension PhotoNotePatterns on PhotoNote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoNote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoNote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoNote value)  $default,){
final _that = this;
switch (_that) {
case _PhotoNote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoNote value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoNote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String desc,  String imagePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoNote() when $default != null:
return $default(_that.id,_that.title,_that.desc,_that.imagePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String desc,  String imagePath)  $default,) {final _that = this;
switch (_that) {
case _PhotoNote():
return $default(_that.id,_that.title,_that.desc,_that.imagePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String desc,  String imagePath)?  $default,) {final _that = this;
switch (_that) {
case _PhotoNote() when $default != null:
return $default(_that.id,_that.title,_that.desc,_that.imagePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoNote with DiagnosticableTreeMixin implements PhotoNote {
  const _PhotoNote({required this.id, required this.title, required this.desc, required this.imagePath});
  factory _PhotoNote.fromJson(Map<String, dynamic> json) => _$PhotoNoteFromJson(json);

@override final  String id;
@override final  String title;
@override final  String desc;
@override final  String imagePath;

/// Create a copy of PhotoNote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoNoteCopyWith<_PhotoNote> get copyWith => __$PhotoNoteCopyWithImpl<_PhotoNote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoNoteToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PhotoNote'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('desc', desc))..add(DiagnosticsProperty('imagePath', imagePath));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoNote&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,desc,imagePath);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PhotoNote(id: $id, title: $title, desc: $desc, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class _$PhotoNoteCopyWith<$Res> implements $PhotoNoteCopyWith<$Res> {
  factory _$PhotoNoteCopyWith(_PhotoNote value, $Res Function(_PhotoNote) _then) = __$PhotoNoteCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String desc, String imagePath
});




}
/// @nodoc
class __$PhotoNoteCopyWithImpl<$Res>
    implements _$PhotoNoteCopyWith<$Res> {
  __$PhotoNoteCopyWithImpl(this._self, this._then);

  final _PhotoNote _self;
  final $Res Function(_PhotoNote) _then;

/// Create a copy of PhotoNote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? desc = null,Object? imagePath = null,}) {
  return _then(_PhotoNote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
