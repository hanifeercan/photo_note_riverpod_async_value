import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_note_riverpod_async_value/pages/providers/photo_note_list/photo_note_list_provider.dart';

class NewPhotoNote extends ConsumerStatefulWidget {
  const NewPhotoNote({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewPhotoNoteState();
}

class _NewPhotoNoteState extends ConsumerState<NewPhotoNote> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  File? selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveNote() {
    final title = titleController.text.trim();
    final desc = descController.text.trim();

    if (title.isEmpty || desc.isEmpty || selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields!')),
      );
      return;
    }

    ref
        .read(photoNoteListProvider.notifier)
        .addPhotoNote(title, desc, selectedImage!.path);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('New Photo Note')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImagePicker(),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              ElevatedButton(onPressed: _saveNote, child: const Text('SAVE')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
          image: DecorationImage(
            image: selectedImage != null
                ? FileImage(selectedImage!) as ImageProvider
                : const AssetImage('assets/images/add_image.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
