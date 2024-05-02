// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class NoteBook extends ChangeNotifier{
  List<String> _words = ["apple","banana"];
  List<String> get words => List.unmodifiable(_words);

  void add(String text) {
    _words.add(text);
    notifyListeners();
  }

  void edit(int index, newtext){
    _words[index] = newtext;
    notifyListeners();
  }

  void delete(int index){
    _words.removeAt(index);
    notifyListeners();
  }
}