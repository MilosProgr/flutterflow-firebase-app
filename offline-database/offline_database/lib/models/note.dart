import 'package:isar/isar.dart';

//ovaj deo je neophodan da se izgenerise file
//i onda cemo da pokrenemo ovu komandu
part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text; //late se inicijalizuje kasnije
}
