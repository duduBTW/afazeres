import 'package:afazeres/provider/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ListaAfazeresItem extends StatelessWidget {
  final TodoItemsModel item;

  const ListaAfazeresItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      actions: [
        IconSlideAction(
          onTap: () {
            Navigator.of(context).pushNamed("/todo/completed");
            Provider.of<TodoItemsController>(context, listen: false)
                .remove(item.id);
          },
          color: Theme.of(context).primaryColor,
          caption: "Done",
          // icon: Icons.remove_red_eye,
          iconWidget: Icon(
            Icons.done,
            color: Colors.white,
          ),
        ),
      ],
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed("/todo", arguments: item.id),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
          child: Row(
            children: [
              Container(
                width: 15,
                margin: EdgeInsets.only(right: 15),
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).primaryColor),
              ),
              Expanded(
                child: Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
