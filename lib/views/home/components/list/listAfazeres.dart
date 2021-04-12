import 'package:afazeres/provider/todo.dart';
import 'package:flutter/material.dart';

import 'listAfazeresItem.dart';

class ListAfazeresHome extends StatelessWidget {
  final List<TodoItemsModel> listTodos;

  const ListAfazeresHome({Key key, this.listTodos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (ctx, index) => ListaAfazeresItem(listTodos[index]),
        itemCount: listTodos.length,
      ),
    );
  }
}
