import 'package:afazeres/provider/todo.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  final TodoItemsModel item;

  const HeaderHome({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("id: ${item.id}");
        Navigator.of(context).pushNamed("/todo", arguments: item.id);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30.0),
        child: Text(
          item.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
