import 'package:photo_note_riverpod_async_value/models/photo_note.dart';

abstract class PhotoNoteRepository {
  Future<List<PhotoNote>> getPhotoNotes();
  Future<PhotoNote> getPhotoNote(String id);
  Future<void> addPhotoNote({required PhotoNote photoNote});
  Future<void> editPhotoNoteTitle({
    required String id,
    required String title,
  });
  Future<void> editPhotoNoteDesc({
    required String id,
    required String desc,
  });
  Future<void> editPhotoNoteImage({
    required String id,
    required String imagePath,
  });
  Future<void> removePhotoNote({required String id});
}
