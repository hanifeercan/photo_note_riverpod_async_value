import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_note_riverpod_async_value/models/photo_note.dart';
import 'package:photo_note_riverpod_async_value/pages/providers/photo_note_item_provider.dart/photo_note_item_provider.dart';
import 'package:photo_note_riverpod_async_value/pages/providers/photo_note_list/photo_note_list_provider.dart';
import 'package:photo_note_riverpod_async_value/pages/widgets/photo_note_item.dart';

class ShowPhotoNotes extends ConsumerStatefulWidget {
  const ShowPhotoNotes({super.key});

  @override
  ConsumerState<ShowPhotoNotes> createState() => _ShowPhotoNotesState();
}

class _ShowPhotoNotesState extends ConsumerState<ShowPhotoNotes> {
  Widget prevTodosWidget = const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    final photoNoteListState = ref.watch(photoNoteListProvider);

    return photoNoteListState.when(
      skipError: false,
      data: (List<PhotoNote> allNotes) {
        if (allNotes.isEmpty) {
          prevTodosWidget = const Center(
            child: Text(
              'Your photo note list is empty! Let\'s create new photo note. ',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
          );
          return prevTodosWidget;
        }

        prevTodosWidget = ListView.builder(
          itemCount: allNotes.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = allNotes[index];
            return ProviderScope(
              overrides: [photoNoteItemProvider.overrideWithValue(todo)],
              child: const PhotoNoteItem(),
            );
          },
        );
        return prevTodosWidget;
      },
      error: (error, _) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error.toString(), style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  ref.invalidate(photoNoteListProvider);
                },
                child: const Text(
                  'Please Retry!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
