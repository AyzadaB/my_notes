import 'package:my_notes/features/data/model/note_model.dart';
import 'package:my_notes/features/data/source/note_local_source.dart';

class NoteRepository {
  final NoteLocalSource localSource;
  NoteRepository(this.localSource);

  List<NoteModel> getAllNotes() {
    return localSource.getNotes();
  }

  Future<void> addNotes(NoteModel notes) async {
    await localSource.addNotes(notes);
  }

  Future<void> updateNotes(int index, NoteModel notes) async {
    await localSource.updateNotes(index, notes);
  }

  Future<void> deleteNotes(int index) async {
    await localSource.deleteNotes(index);
  }
}
