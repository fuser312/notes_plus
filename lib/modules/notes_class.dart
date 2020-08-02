import 'package:intl/intl.dart';

class Note {
  DateTime createdOn;
  DateTime editedOn;
  String noteText;
  String title;

  Note({DateTime createdOn, DateTime editedOn, String noteText = "",String title}) {
    this.createdOn = createdOn ?? DateTime.now();
    this.editedOn = editedOn ?? DateTime.now();
    this.noteText = noteText??"";
//    this.title=title ?? DateFormat('dd-MM-yyyy – kk:mm').format(DateTime.now()).toString();
    this.title=title ??"This is a title";
  }

  updateNote(String newText) {
    this.noteText = newText;
  }
  @override
  String toString() {
    return "created:${this.createdOn.millisecondsSinceEpoch.toString()} , edited:${this.editedOn.millisecondsSinceEpoch.toString()} ,Title:${this.title} ,Note:${this.noteText} ";
  }
}

class AllNotes {
  List<Note> list = [];

  AllNotes({List<Note> allNotes}) {
    this.list = allNotes ?? [];
  }

  List<Note> addNote(Note note) {
    this.list.add(note);
    return this.list;
  }

  List<Note> updateNote(int index, Note newNote) {
    this.list[index] = newNote;
    return this.list;
  }
}
