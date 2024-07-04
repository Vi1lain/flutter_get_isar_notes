import 'package:flutter/material.dart';
import 'package:flutter_get_isar_notes/database/my_controller.dart';
import 'package:flutter_get_isar_notes/screens/notes_list.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_rx/get_rx.dart';

void main() async {
  /// initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();

  await MyController.initDB();
  runApp( GetBuilder<MyController>(init: MyController(),builder: (controller) => MyApp(),));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:NotesList()
    );
  }
}

