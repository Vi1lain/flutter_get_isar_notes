import 'package:flutter/material.dart';
import 'package:flutter_get_isar_notes/database/my_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final  getX = Get.find<MyController>();
    final titleController = TextEditingController();
    return AlertDialog(
      title: const Text('Add Note'),
      content: TextField(controller: titleController,),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            getX.addNote(titleController.text);
            Get.back();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
