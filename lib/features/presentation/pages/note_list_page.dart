import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/data/model/note_model.dart';
import 'package:my_notes/features/logic/cubit/note_cubit.dart';
import 'package:my_notes/features/logic/cubit/note_state.dart';
import 'package:my_notes/features/presentation/pages/add_note_page.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  NoteListPageState createState() => NoteListPageState();
}

class NoteListPageState extends State<NoteListPage> {
  @override
  void initState() {
    super.initState();
    // Загружаем персонажей из Hive через Cubit
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NoteCubit>().loadNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sheet of Notes")),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return ListTile(
                leading: IconButton(
                  onPressed: () async {
                    final updateNotes = await Navigator.push<NoteModel>(
                      context,
                      MaterialPageRoute(builder: (context) => NoteListPage()),
                    );
                    if (!mounted) return;
                    if (updateNotes != null) {
                      context.read<NoteCubit>().updateNotes(index, updateNotes);
                    }
                  },
                  icon: Icon(Icons.edit, color: Colors.blueAccent),
                ),
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: IconButton(
                  onPressed: () {
                    context.read<NoteCubit>().deleteNotes(index);
                  },
                  icon: Icon(Icons.delete, color: Colors.orange),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 200, right: 50),
        child: FloatingActionButton(
          onPressed: () async {
            final newNotes = await Navigator.push<NoteModel>(
              context,
              MaterialPageRoute(builder: (context) => AddNotePage()),
            );
            if (!mounted) return;
            if (newNotes != null) {
              context.read<NoteCubit>().addNotes(newNotes);
            }
          },
          child: Icon(Icons.add, size: 40),
        ),
      ),
    );
  }
}
