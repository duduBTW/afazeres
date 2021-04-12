import 'package:afazeres/provider/newTodo.dart';
import 'package:afazeres/provider/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/time.dart';

class SelectTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewPageDate(
      label: "Select time",
      onCancel: () => Navigator.of(context).pop(),
      onNext: () {
        var newTodo = Provider.of<NewTodoController>(context, listen: false);
        Provider.of<TodoItemsController>(context, listen: false).addTodo(
            TodoItemsModel(
                description: newTodo.description,
                date: newTodo.date,
                time: newTodo.time));

        Provider.of<NewTodoController>(context, listen: false).clean();

        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushNamed("/new/completed");
      },
    );
  }
}
