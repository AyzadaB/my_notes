import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/features/data/model/note_model.dart';
import 'package:my_notes/features/data/repository/note_repository.dart';
import 'package:my_notes/features/data/source/note_local_source.dart';
import 'package:my_notes/features/logic/cubit/note_cubit.dart';
import 'package:my_notes/features/presentation/pages/note_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Инициализация Hive
  await Hive.initFlutter();

  //Регистрация адаптера
  Hive.registerAdapter(NoteModelAdapter());

  //Открытие бокса
  await Hive.openBox<NoteModel>('notes');

  final localSource = NoteLocalSource();
  final repository = NoteRepository(localSource);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final NoteRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NoteCubit(repository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const NoteListPage(),
      ),
    );
  }
}
