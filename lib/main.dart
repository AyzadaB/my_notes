import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/features/data/model/note_model.dart';
import 'package:my_notes/features/presentation/note_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Инициализация Hive
  await Hive.initFlutter();

  //Регистрация адаптера
  Hive.registerAdapter(NoteModelAdapter());

  //Открытие бокса
  await Hive.openBox<NoteModel>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NoteListPage(),
    );
  }
}
