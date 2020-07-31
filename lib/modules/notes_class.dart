class Note {
  DateTime createdOn;
  DateTime editedOn;
  String noteText;

  Note({DateTime createdOn, DateTime editedOn, String noteText = ""}) {
    this.createdOn = createdOn ?? DateTime.now();
    this.editedOn = editedOn ?? DateTime.now();
    this.noteText = noteText;
  }

  updateNote(String newText) {
    this.noteText = newText;
  }
  @override
  String toString() {
    return "${this.createdOn.millisecondsSinceEpoch.toString()} , ${this.editedOn.millisecondsSinceEpoch.toString()} , ${this.noteText} ";
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

  void updateNote(int index, Note newNote) {
    this.list[index] = newNote;
  }
}
