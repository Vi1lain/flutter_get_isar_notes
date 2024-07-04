import 'package:isar/isar.dart';

part 'entity.g.dart';


///then run: dart run build_runner build
@collection
class Note {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

 late String text;

  late  bool check;
}