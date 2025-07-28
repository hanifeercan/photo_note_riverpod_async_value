import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_note_riverpod_async_value/models/photo_note.dart';
import 'package:photo_note_riverpod_async_value/pages/providers/photo_note_detail/photo_note_detail_provider.dart';
import 'package:photo_note_riverpod_async_value/pages/providers/photo_note_list/photo_note_list_provider.dart';

class ConfirmEditDialog extends ConsumerStatefulWidget {
  final PhotoNote photoNote;
  final String titleOrDesc;
  const ConfirmEditDialog({
    super.key,
    required this.photoNote,
    required this.titleOrDesc,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfirmEditDialogState();
}

class _ConfirmEditDialogState extends ConsumerState<ConfirmEditDialog> {
  late final TextEditingController textController;
  bool error = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(
      text: widget.titleOrDesc == "title"
          ? widget.photoNote.title
          : widget.photoNote.desc,
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Todo'),
      content: TextField(
        controller: textController,
        maxLines: widget.titleOrDesc == "title" ? 1 : 3,
        autofocus: true,
        decoration: InputDecoration(
          errorText: error ? 'Value cannot be empty' : null,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            error = textController.text.isEmpty ? true : false;
            if (error) {
              setState(() {});
            } else {
              if (widget.titleOrDesc == "title") {
                ref
                    .read(photoNoteDetailProvider(widget.photoNote.id).notifier)
                    .editPhotoNoteTitle(widget.photoNote, textController.text);

                ref.invalidate(photoNoteListProvider);
              } else {
                ref
                    .read(photoNoteDetailProvider(widget.photoNote.id).notifier)
                    .editPhotoNoteDesc(widget.photoNote, textController.text);
              }
              Navigator.pop(context);
            }
          },
          child: const Text('EDIT'),
        ),
      ],
    );
  }
}
