import 'package:bloc/bloc.dart';
import 'package:my_notes/features/data/repository/note_repository.dart';
import 'package:my_notes/features/logic/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteRepository repository;

  NoteCubit(this.repository) : super(NoteState.initial());
}
