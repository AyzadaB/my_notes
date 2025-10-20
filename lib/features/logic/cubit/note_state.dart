import 'package:equatable/equatable.dart';
import 'package:my_notes/features/data/model/note_model.dart';

class NoteState extends Equatable {
  final List<NoteModel> notes;
  final bool isLoading;

  const NoteState({required this.notes, required this.isLoading});

  //изначальное состояние
  factory NoteState.initial() {
    return NoteState(notes: [], isLoading: false);
  }

  //Позволяет создать новое состояние на основе старого, изменив только нужные поля.
  NoteState copyWith({List<NoteModel>? notes, bool? isLoading}) {
    return NoteState(
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [notes, isLoading];
}
