import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //reference the hive box
  final _mybox = Hive.box('mybox');

  //list of to do tasks
  List toDoList = [];

  //run this method if this is the first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Welcome to your ToDo App", false],
      ["Tap + button to add a new task", false],
      ["Tap the checkbox to mark as done", false],
    ];
  }

  //load data from db
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
