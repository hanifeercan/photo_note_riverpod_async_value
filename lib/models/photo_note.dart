import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'photo_note.freezed.dart';
part 'photo_note.g.dart';

Uuid uuid = const Uuid();

@freezed
abstract class PhotoNote with _$PhotoNote {
  const factory PhotoNote({
    required String id,
    required String title,
    required String desc,
    required String imagePath,
  }) = _PhotoNote;

  factory PhotoNote.add({
    required String title,
    required String desc,
    required String imagePath,
  }) {
    return PhotoNote(
      id: uuid.v4(),
      title: title,
      desc: desc,
      imagePath: imagePath,
    );
  }

  factory PhotoNote.fromJson(Map<String, dynamic> json) =>
      _$PhotoNoteFromJson(json);
}
