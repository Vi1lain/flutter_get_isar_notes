import 'package:flutter_get_isar_notes/entity/entity.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class MyController extends GetxController {
  //static late Isar isar = Get.find<Isar>();
  static late Isar isar;

  final List<Note> myList = <Note>[].obs;

  @override
  void onInit() {
    //ever(myList as RxInterface<Object?>, (callback) => readNoteList());
    readNoteList();
    super.onInit();
  }

  /// INITIALIZE DB
  static initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  /// CREATE NOTE
  addNote(String textFromNote) async {
    final newNote = Note()..text = textFromNote..check = false;
    await isar.writeTxn(() => isar.notes.put(newNote));
    await readNoteList();
  }

  /// READ NOTES
  readNoteList() async {
    List<Note> isarListNotes = await isar.notes.where().findAll();
    myList.clear();
    myList.addAll(isarListNotes);
  }

  /// UPDATE NOTE
  updateNote (int id, String newTitle) async{
    final note =  await isar.notes.get(id);
if(note!=null){
   note.text = newTitle;
  await isar.writeTxn(() => isar.notes.put(note));
}
    await readNoteList();
  }
  /// UPDATE NOTE CHACK
  updateChackNote (bool value,int id) async{
    final note =  await isar.notes.get(id);
    if(note!=null){
      note.check = value;

      await isar.writeTxn(() => isar.notes.put(note));
    }
    await readNoteList();
  }


  /// DELETE NOTE
  deleteNote(int id) async {
    await isar.writeTxn(() async => await isar.notes.delete(id));
    await readNoteList();
  }
}
