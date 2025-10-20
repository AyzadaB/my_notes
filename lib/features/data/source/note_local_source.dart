import 'package:hive/hive.dart';
import 'package:my_notes/features/data/model/note_model.dart';

class NoteLocalSource {
  final Box<NoteModel> _noteBox = Hive.box<NoteModel>('notes');
  //Box — это как таблица в Hive.
  //_noteBox — приватная переменная, в которой открывается "коробка" (box) под названием 'notes'.
  //<NoteModel> указывает, что в этой коробке хранятся объекты типа NoteModel.
  //Этот box должен быть открыт в main.dart, до использования:
  //await Hive.openBox<NoteModel>('notes');

  List<NoteModel> getNotes() {
    return _noteBox.values.toList();
  } //values возвращает все значения (все заметки), хранящиеся в box.
  //.toList() превращает их в обычный список Dart (List<NoteModel>).
  //Этот метод используется, когда нужно отобразить все заметки на экране.

  Future<void> addNotes(NoteModel notes) async {
    await _noteBox.add(notes);
  } //Добавляет новую заметку в box.
  //add() автоматически присваивает ей индекс (ключ).
  //Используется, когда пользователь создаёт новую заметку.

  Future<void> updateNotes(int index, NoteModel notes) async {
    await _noteBox.putAt(index, notes);
  } //putAt(index, value) заменяет заметку по определённому индексу.
  //Например, если заметка находится в списке под индексом 2, этот метод обновит именно её.
  //Используется при редактировании заметки.

  Future<void> deleteNotes(int index) async {
    await _noteBox.delete(index);
  } //Удаляет заметку по индексу из box.

  //После этого в UI её больше не будет.
}
