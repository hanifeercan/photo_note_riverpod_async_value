import 'package:photo_note_riverpod_async_value/models/photo_note.dart';
import 'package:photo_note_riverpod_async_value/repository/providers/photo_note_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_note_detail_provider.g.dart';

@riverpod
class PhotoNoteDetail extends _$PhotoNoteDetail {
  @override
  FutureOr<PhotoNote> build(String id) {
    return _getPhotoNote(id);
  }

  Future<PhotoNote> _getPhotoNote(String id) {
    return ref.read(photoNoteRepositoryProvider).getPhotoNote(id);
  }

  Future<void> editPhotoNoteTitle(PhotoNote note, String title) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref
          .read(photoNoteRepositoryProvider)
          .editPhotoNoteTitle(id: note.id, title: title);

      final photoNote = state.value!;
      return photoNote.copyWith(
        title: title,
        desc: note.desc,
        imagePath: note.imagePath,
      );
    });
  }

  Future<void> editPhotoNoteDesc(PhotoNote note, String desc) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref
          .read(photoNoteRepositoryProvider)
          .editPhotoNoteDesc(id: note.id, desc: desc);

      final photoNote = state.value!;
      return photoNote.copyWith(
        title: note.title,
        desc: desc,
        imagePath: note.imagePath,
      );
    });
  }

  Future<void> editPhotoNoteImage(PhotoNote note, String imagePath) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref
          .read(photoNoteRepositoryProvider)
          .editPhotoNoteImage(id: note.id, imagePath: imagePath);

      final photoNote = state.value!;
      return photoNote.copyWith(
        title: note.title,
        desc: note.desc,
        imagePath: imagePath,
      );
    });
  }

  Future<void> removePhotoNote(String id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(photoNoteRepositoryProvider).removePhotoNote(id: id);

      return PhotoNote(id: "", title: "", desc: "", imagePath: "");
    });
  }
}
