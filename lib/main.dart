import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:notes_plus/modules/all_notes_observor.dart';
import 'package:notes_plus/screens/home_screen.dart';

void main() {
  Bloc.observer = AllNotesObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}


