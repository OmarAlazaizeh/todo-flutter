import 'package:hive_flutter/hive_flutter.dart';

class TasksDatabase {
  List tasksList = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  // Rund this method if this is the first time every opening this app
  void createInitialData() {
    tasksList = [
      ['Completed task ✅', true],
      ['This is a new task', false],
      ['Slide to delete this task', false],
    ];
  }

  // Load the data from the database
  void loadData() {
    tasksList = _myBox.get('TASKSLIST');
  }

  // Update the database
  void updateData() {
    _myBox.put('TASKSLIST', tasksList);
  }
}
