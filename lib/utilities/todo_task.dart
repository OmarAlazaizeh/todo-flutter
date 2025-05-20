import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          // The end action pane is the one at the right or the bottom side.
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                onPressed: deleteTask,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ],
          ),
          child: Container(
            // margin: EdgeInsets.only(top: 10.0, bottom: 10),
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
          ),
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}
