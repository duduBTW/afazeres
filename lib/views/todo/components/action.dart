import 'package:afazeres/provider/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarkedAsDone extends StatelessWidget {
  final String id;

  const MarkedAsDone({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).popAndPushNamed("/todo/completed");
        Provider.of<TodoItemsController>(context, listen: false).remove(id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "MARK AS COMPLETED",
              style: Theme.of(context).textTheme.button,
            ),
            Icon(Icons.navigate_next_sharp)
          ],
        ),
      ),
    );
  }
}
