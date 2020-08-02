import 'package:bloc/bloc.dart';
import 'package:notes_plus/modules/notes_class.dart';

class AllNotesCubit extends Cubit<AllNotes> {
  AllNotesCubit(AllNotes state) : super(state);

  void addNote(Note note) {
    List<Note> newList =state.addNote(note);
    emit(new AllNotes(allNotes: newList));
  }
  void updateNote(int index, Note newNote) {
    List<Note> newList= state.updateNote(index, newNote);
    emit(new AllNotes(allNotes: newList));
  }

}