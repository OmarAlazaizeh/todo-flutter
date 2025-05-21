import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utilities/todo_task.dart';
import 'package:todo_app/utilities/dialog_box.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // reference the box
  final _myBox = Hive.box('mybox');

  TasksDatabase dp = TasksDatabase();

  @override
  void initState() {
    // If this is the first time every opening the app, then create default data
    if (_myBox.get('TASKSLIST') == null) {
      dp.createInitialData();
    } else {
      // There is already exist data
      dp.loadData();
    }

    super.initState();
  }

  // text controller
  final TextEditingController _textControler = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      dp.tasksList[index][1] = !dp.tasksList[index][1];
    });

    dp.updateData();
  }

  void saveNewTask() {
    setState(() {
      dp.tasksList.add([_textControler.text, false]);

      _textControler.clear();
    });

    Navigator.of(context).pop();
    dp.updateData();
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
      dp.tasksList.removeAt(index);
    });

    dp.updateData();
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
          itemCount: dp.tasksList.length,
          itemBuilder: (context, index) {
            return Task(
              taskName: dp.tasksList[index][0],
              taskCompleted: dp.tasksList[index][1],
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
