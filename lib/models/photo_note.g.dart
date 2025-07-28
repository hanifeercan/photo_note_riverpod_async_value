// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoNote _$PhotoNoteFromJson(Map<String, dynamic> json) => _PhotoNote(
  id: json['id'] as String,
  title: json['title'] as String,
  desc: json['desc'] as String,
  imagePath: json['imagePath'] as String,
);

Map<String, dynamic> _$PhotoNoteToJson(_PhotoNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'imagePath': instance.imagePath,
    };
