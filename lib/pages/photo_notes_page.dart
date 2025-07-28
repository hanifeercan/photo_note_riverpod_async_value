import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:photo_note_riverpod_async_value/pages/new_photo_note_page.dart';
import 'package:photo_note_riverpod_async_value/pages/widgets/show_photo_notes.dart';

class PhotoNotesPage extends StatelessWidget {
  const PhotoNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Photo Note List"),
          titleTextStyle: TextStyle(fontSize: 24, color: Colors.brown),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 223, 221, 214),
        ),
        body: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: const Center(
            child: SpinKitFadingCircle(
              color: Color.fromARGB(255, 193, 177, 177),
            ),
          ),
          overlayColor: Colors.grey.withOpacity(0.4),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: [Expanded(child: ShowPhotoNotes())]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewPhotoNote(),
              ),
            );
          },
          backgroundColor: const Color.fromARGB(255, 223, 221, 214),
          foregroundColor: Colors.brown, 
          elevation: 6,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
