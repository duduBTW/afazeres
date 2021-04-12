import 'package:afazeres/provider/todo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'components/action.dart';
import 'components/header.dart';

class TodoItem extends StatefulWidget {
  final String id;

  const TodoItem(this.id);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool _isEditing = false;
  TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(
        text: Provider.of<TodoItemsController>(context, listen: false)
            .todo(widget.id)
            .comment);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var todo = Provider.of<TodoItemsController>(context).todo(widget.id);

    List<Widget> headerTodo = todo != null
        ? [
            HeaderTodoItem(),
            Spacer(),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  DateFormat("dd/MM/yyyy").format(todo.date) +
                      " " +
                      todo.time.format(context),
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  todo.description,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            )
          ]
        : [];

    return Scaffold(
      body: todo != null
          ? SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  ...headerTodo,
                  Spacer(),
                  !_isEditing
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              _isEditing = true;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              todo.comment == ""
                                  ? "Add comment..."
                                  : todo.comment,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextField(
                            onSubmitted: (newValue) {
                              Provider.of<TodoItemsController>(context,
                                      listen: false)
                                  .editComment(widget.id, newValue);
                              setState(() {
                                _isEditing = false;
                              });
                            },
                            controller: _editingController,
                            autofocus: true,
                            style: Theme.of(context).textTheme.bodyText2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                  Spacer(),
                  MarkedAsDone(
                    id: todo.id,
                  )
                ],
              ),
            )
          : Center(child: Text("Item not found")),
    );
  }
}
