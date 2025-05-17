import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        // elevation: 10.0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        // shadowColor: Colors.black,
      ),
      // backgroundColor: Colors.amber,
    );
  }
}
