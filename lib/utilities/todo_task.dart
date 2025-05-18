import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        // color: Colors.blueGrey[900],
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Checkbox(value: taskCompleted, onChanged: onChanged),
          Text(
            taskName,
            style: TextStyle(
              decoration:
                  taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
