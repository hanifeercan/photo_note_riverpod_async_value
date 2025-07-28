import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:photo_note_riverpod_async_value/models/photo_note.dart';
import 'package:photo_note_riverpod_async_value/pages/providers/photo_note_detail/photo_note_detail_provider.dart';
import 'package:photo_note_riverpod_async_value/pages/widgets/confirm_edit_dialog.dart';

class PhotoNotesDetailPage extends ConsumerStatefulWidget {
  final String id;
  const PhotoNotesDetailPage({super.key, required this.id});

  @override
  ConsumerState<PhotoNotesDetailPage> createState() =>
      _PhotoNotesDetailPageState();
}

class _PhotoNotesDetailPageState extends ConsumerState<PhotoNotesDetailPage> {
  File? selectedImage;

  Future<void> _pickImage(PhotoNote photoNote) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      await ref
          .read(photoNoteDetailProvider(photoNote.id).notifier)
          .editPhotoNoteImage(photoNote, selectedImage!.path);
      ref.invalidate(photoNoteDetailProvider(photoNote.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final photoNoteState = ref.watch(photoNoteDetailProvider(widget.id));
    return SafeArea(
      child: Scaffold(
        body: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: const Center(
            child: SpinKitFadingCircle(color: Colors.grey),
          ),
          overlayColor: Colors.grey.withOpacity(0.4),
          child: photoNoteState.when(
            skipError: false,
            data: (PhotoNote photoNote) {
              if (photoNote.id == "") {
                return const Center(
                  child: Text(
                    'The photo note you are looking for is not registered.',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(photoNote),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                          image: DecorationImage(
                            image: (photoNote.imagePath.isNotEmpty)
                                ? FileImage(File(photoNote.imagePath))
                                      as ImageProvider
                                : const AssetImage(
                                    'assets/images/add_image.png',
                                  ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ConfirmEditDialog(
                              photoNote: photoNote,
                              titleOrDesc: "title",
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            photoNote.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ConfirmEditDialog(
                              photoNote: photoNote,
                              titleOrDesc: "desc",
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            photoNote.desc,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error, _) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      error.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        ref.invalidate(photoNoteDetailProvider);
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
          ),
        ),
      ),
    );
  }
}
