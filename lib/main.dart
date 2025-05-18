import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,

          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.deepOrange[50],
      ),
      home: TodoPage(),
    );
  }
}
