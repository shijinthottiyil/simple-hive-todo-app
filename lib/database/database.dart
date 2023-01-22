import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  final _myBox = Hive.box('mybox');
  List toDoList = [];
  void initialData() {
    toDoList = [
      [
        'sample',
        false,
      ],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("SHIJIN");
  }

  void updateData() {
    _myBox.put("SHIJIN", toDoList);
  }
}
