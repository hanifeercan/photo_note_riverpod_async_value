import 'package:hive_flutter/hive_flutter.dart';
import 'package:photo_note_riverpod_async_value/models/photo_note.dart';
import 'package:photo_note_riverpod_async_value/repository/photo_note_repository.dart';

const int kDelayDuration = 1;

class HiveRepository extends PhotoNoteRepository {
  final Box photoNoteBox = Hive.box('photoNote');

  Future<void> waitSeconds() {
    return Future.delayed(const Duration(seconds: kDelayDuration));
  }

  @override
  Future<List<PhotoNote>> getPhotoNotes() async {
    await waitSeconds();

    try {
      if (photoNoteBox.length == 0) return [];

      return [
        for (final photoNote in photoNoteBox.values)
          PhotoNote.fromJson(Map<String, dynamic>.from(photoNote)),
      ];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PhotoNote> getPhotoNote(String id) async {
    await waitSeconds();

    try {
      if (photoNoteBox.get(id) == false) {
        return PhotoNote(id: "", title: "", desc: "", imagePath: "");
      }

      final photoNoteMap = photoNoteBox.get(id);
      return PhotoNote.fromJson(Map<String, dynamic>.from(photoNoteMap));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addPhotoNote({required PhotoNote photoNote}) async {
    await waitSeconds();

    try {
      await photoNoteBox.put(photoNote.id, photoNote.toJson());
      print("add");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editPhotoNoteTitle({
    required String id,
    required String title,
  }) async {
    await waitSeconds();

    try {
      final photoNoteMap = photoNoteBox.get(id);
      photoNoteMap['title'] = title;
      await photoNoteBox.put(id, photoNoteMap);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editPhotoNoteDesc({
    required String id,
    required String desc,
  }) async {
    await waitSeconds();

    try {
      final photoNoteMap = photoNoteBox.get(id);
      photoNoteMap['desc'] = desc;
      await photoNoteBox.put(id, photoNoteMap);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editPhotoNoteImage({
    required String id,
    required String imagePath,
  }) async {
    await waitSeconds();

    try {
      final photoNoteMap = photoNoteBox.get(id);
      photoNoteMap['imagePath'] = imagePath;
      await photoNoteBox.put(id, photoNoteMap);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removePhotoNote({required String id}) async {
    await waitSeconds();

    try {
      await photoNoteBox.delete(id);
    } catch (e) {
      rethrow;
    }
  }
}
