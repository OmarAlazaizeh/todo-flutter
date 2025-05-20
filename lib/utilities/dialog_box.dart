import 'package:flutter/material.dart';
import 'package:todo_app/utilities/dialog_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.textConterler,
    required this.onSave,
    required this.onCancel,
  });

  final TextEditingController textConterler;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 160.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textConterler,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Create a new task',
                filled: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DialogButton(buttonText: 'Save', onPressed: onSave),
                // SizedBox(width: 10.0),
                DialogButton(buttonText: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
