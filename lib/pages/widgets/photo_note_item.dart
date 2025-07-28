import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_note_riverpod_async_value/pages/photo_note_detail_page.dart';
import 'package:photo_note_riverpod_async_value/pages/providers/photo_note_item_provider.dart/photo_note_item_provider.dart';
import 'package:photo_note_riverpod_async_value/pages/providers/photo_note_list/photo_note_list_provider.dart';

class PhotoNoteItem extends ConsumerWidget {
  const PhotoNoteItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoNote = ref.watch(photoNoteItemProvider);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoNotesDetailPage(id: photoNote.id),
              ),
            );
          },
          title: Text(photoNote.title, style: TextStyle(fontSize: 20)),
          trailing: IconButton(
            onPressed: () async {
              final removeOrNot = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you really want to delete?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );

              if (removeOrNot) {
                ref
                    .read(photoNoteListProvider.notifier)
                    .removePhotoNote(photoNote.id);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
