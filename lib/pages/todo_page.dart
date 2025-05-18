import 'package:flutter/material.dart';
import 'package:todo_app/utilities/todo_task.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // TODO: you can move this to a separete file
  List tasksList = [
    ['Move your salary to JIB', true],
    ['Remind the boys with YouTube subscription', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tasksList[index][1] = !tasksList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            return Task(
              taskName: tasksList[index][0],
              taskCompleted: tasksList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ),
      ),
    );
  }
}
