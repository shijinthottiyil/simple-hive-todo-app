import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/alertdialog_widget.dart';
import '../widgets/container_widget.dart';
import '../../database/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('mybox');
  final TextEditingController toDoController = TextEditingController();
  ToDoDataBase db = ToDoDataBase();
  // List toDoList = [];
  @override
  void initState() {
    if (_myBox.get("SHIJIN") == null) {
      db.initialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SizedBox(
        height: 690,
        child: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ContainerWidget(
              value: db.toDoList[index][1],
              isTaskCompleted: db.toDoList[index][1],
              taskName: db.toDoList[index][0],
              checkBoxPressed: () {
                setState(() {
                  db.toDoList[index][1] = !db.toDoList[index][1];
                });
                db.updateData();
              },
              deleteBtnPressed: () {
                setState(() {
                  db.toDoList.removeAt(index);
                });
                db.updateData();
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogWidget(
                toDoController: toDoController,
                addBtnPressed: addBtnPressed,
              );
            },
          );
        }),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void addBtnPressed() {
    setState(() {
      db.toDoList.add([
        toDoController.text,
        false,
      ]);
    });
    db.updateData();
    toDoController.clear();
    Navigator.pop(context);
  }
}
