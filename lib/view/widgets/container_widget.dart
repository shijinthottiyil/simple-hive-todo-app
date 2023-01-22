import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContainerWidget extends StatelessWidget {
  final bool value;
  final void Function() checkBoxPressed;
  final String taskName;
  final void Function() deleteBtnPressed;
  final bool isTaskCompleted;
  const ContainerWidget({
    super.key,
    required this.value,
    required this.checkBoxPressed,
    required this.taskName,
    required this.deleteBtnPressed,
    required this.isTaskCompleted,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.yellow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: value,
              onChanged: (value) {
                checkBoxPressed();
              },
            ),
            Text(
              taskName,
              style: TextStyle(
                decoration: isTaskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            IconButton(
              onPressed: deleteBtnPressed,
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
