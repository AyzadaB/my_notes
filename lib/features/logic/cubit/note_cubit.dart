import 'package:bloc/bloc.dart';
import 'package:my_notes/features/data/model/note_model.dart';
import 'package:my_notes/features/data/repository/note_repository.dart';
import 'package:my_notes/features/logic/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteRepository repository;

  NoteCubit(this.repository) : super(NoteState.initial());

  //Получает список всех персонажей из repository.
  //Создаёт новое состояние через copyWith, чтобы UI обновился с новым списком.
  //emit — ключевой метод Cubit, который вызывает перерисовку UI с новым состоянием.
  void loadNotes() {
    final notes = repository.getAllNotes();
    emit(state.copyWith(notes: notes));
  }

  Future<void> addNotes(NoteModel notes) async {
    await repository.addNotes(notes);
    loadNotes();
  }

  Future<void> updateNotes(int index, NoteModel notes) async {
    await repository.updateNotes(index, notes);
    loadNotes();
  }

  Future<void> deleteNotes(int index) async {
    await repository.deleteNotes(index);
    loadNotes();
  }
}
