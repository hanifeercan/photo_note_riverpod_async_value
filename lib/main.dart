import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:photo_note_riverpod_async_value/pages/photo_notes_page.dart';
import 'package:photo_note_riverpod_async_value/repository/hive_repository.dart';
import 'package:photo_note_riverpod_async_value/repository/providers/photo_note_repository_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('photoNote');

  runApp(ProviderScope(
      overrides: [
        photoNoteRepositoryProvider.overrideWithValue(HiveRepository()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PhotoNotesPage(),
    );
  }
}
