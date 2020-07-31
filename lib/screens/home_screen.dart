import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_plus/modules/all_notes_cubit.dart';
import 'package:notes_plus/modules/notes_class.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AllNotesCubit allNotes=AllNotesCubit(new AllNotes());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => allNotes,
      child: BlocBuilder<AllNotesCubit, AllNotes>(
//        cubit:AllNotesCubit(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("All Notes"),
              centerTitle: true,
            ),
            body: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("A New Note "),
                    subtitle:
                    Text(state.list[index].createdOn.toLocal().toString()),
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_circle),
              onPressed: () =>
                  context.bloc<AllNotesCubit>().addNote(new Note(noteText: "hello")),
            ),
          );
        },
      ),
    );
  }
}


