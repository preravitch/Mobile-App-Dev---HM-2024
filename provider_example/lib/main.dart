import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/homepage.dart';
import 'package:provider_example/state.dart';


void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteBook(),
        ),
        //Other Providers
      ],
      child: const MaterialApp(
        home: Homepage(),
        ),
    ),
  );
}