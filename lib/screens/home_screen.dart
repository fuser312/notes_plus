import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_plus/modules/all_notes_cubit.dart';
import 'package:notes_plus/modules/notes_class.dart';
import 'package:notes_plus/screens/notes_editing_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AllNotesCubit allNotes = AllNotesCubit(new AllNotes());

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
                    title: Text(state.list[index].title),
                    subtitle: Text(state.list[index].noteText),
                    isThreeLine: true,
                    onTap: () async {
                      Note result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditingNotes(currNote: state.list[index]),
                        ),
                      );
                      print("result is ${result.runtimeType}");
                      print("result is $result");
                      context.bloc<AllNotesCubit>().updateNote(
                            index,
                            result,
                          );
                      state.list[index] = result;
//                      print("result is $result");
                    },
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_circle),
              onPressed: () => context.bloc<AllNotesCubit>().addNote(
                    new Note(noteText: "hello"),
                  ),
            ),
          );
        },
      ),
    );
  }
}
