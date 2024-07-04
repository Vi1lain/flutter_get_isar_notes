import 'package:flutter/material.dart';
import 'package:flutter_get_isar_notes/database/my_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'my_alert_dialog.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
     ;
    final MyController getX = Get.put(MyController());
    final newTitleController = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(MyAlertDialog()),
        child: Icon(Icons.add),
      ),
      body: Obx(() => ListView.separated(
          itemCount: getX.myList.length,
          itemBuilder: (context, index) {
           var  oneNote = getX.myList[index];

            return Slidable(
              startActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (context) {
                    newTitleController.text = oneNote.text;
                    Get.defaultDialog(
                      title: "Update Note",
                      content: TextField(controller: newTitleController,),
                      confirm: TextButton(onPressed: () {

                        getX.updateNote(oneNote.id, newTitleController.text);
                        Get.back();
                      }, child: Text("Ok"),),
                      cancel: TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('Cancel'),
                      )
                    );
                  },
                  backgroundColor: Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.done,
                  label: 'update',
                ),
              ]),
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (context) {
                    getX.deleteNote(oneNote.id);
                  },
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                )
              ]),
              child: ListTile(
                title: Text(oneNote.text),trailing: Checkbox(value: oneNote.check, onChanged:(value) => getX.updateChackNote(value!,oneNote.id),),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
                height: 10,
              ))),
    );
  }
}
