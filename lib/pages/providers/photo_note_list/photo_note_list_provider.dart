import 'package:photo_note_riverpod_async_value/models/photo_note.dart';
import 'package:photo_note_riverpod_async_value/repository/providers/photo_note_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_note_list_provider.g.dart';

@riverpod
class PhotoNoteList extends _$PhotoNoteList {
  @override
  FutureOr<List<PhotoNote>> build() {
    return _getPhotoNotes();
  }

  Future<List<PhotoNote>> _getPhotoNotes() {
    return ref.read(photoNoteRepositoryProvider).getPhotoNotes();
  }

  Future<void> addPhotoNote(String title, String desc, String imagePath) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final newPhotoNote = PhotoNote.add(
        title: title,
        desc: desc,
        imagePath: imagePath,
      );

      await ref
          .read(photoNoteRepositoryProvider)
          .addPhotoNote(photoNote: newPhotoNote);
      print("add2");

      return [...state.value!, newPhotoNote];
    });
  }

  Future<void> removePhotoNote(String id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(photoNoteRepositoryProvider).removePhotoNote(id: id);

      return [
        for (final todo in state.value!)
          if (todo.id != id) todo,
      ];
    });
  }
}
