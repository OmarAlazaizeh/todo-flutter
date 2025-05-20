import 'package:flutter/material.dart';
import 'package:todo_app/utilities/todo_task.dart';
import 'package:todo_app/utilities/dialog_box.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _textControler = TextEditingController();

  // TODO: you can move this to a separete file
  List tasksList = [
    ['Move your salary to JIB', true],
    ['Remind the boys with YouTube subscription', false],
    ['Pay Internet Bill', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tasksList[index][1] = !tasksList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      tasksList.add([_textControler.text, false]);

      _textControler.clear();
    });

    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder:
          (builder) => DialogBox(
            textConterler: _textControler,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      tasksList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        // backgroundColor: Colors.blueGrey[900],
        backgroundColor: Theme.of(context).colorScheme.primary,
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
              deleteTask: (context) => deleteTask(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
