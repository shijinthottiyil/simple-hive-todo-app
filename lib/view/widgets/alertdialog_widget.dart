import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  TextEditingController? toDoController = TextEditingController();
  final void Function()? addBtnPressed;
  AlertDialogWidget({
    super.key,
    required this.toDoController,
    required this.addBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: toDoController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: addBtnPressed,
                  child: const Text('ADD'),
                ),
                const SizedBox(
                  width: 5,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'CANCEL',
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
