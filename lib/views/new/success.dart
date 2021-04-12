import 'package:afazeres/views/new/components/actions.dart';
import 'package:afazeres/views/todo/components/header.dart';
import 'package:flutter/material.dart';

class TodoNewCompleted extends StatefulWidget {
  @override
  _TodoNewCompletedState createState() => _TodoNewCompletedState();
}

class _TodoNewCompletedState extends State<TodoNewCompleted> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            HeaderTodoItem(),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                "Todo added with success",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Spacer(),
            Center(
              child: ClipRRect(
                  child: Image.asset("assets/notes.gif", height: 260),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Spacer(),
            Container(
              child: ActionItem.center("BACK TO HOME", () {
                Navigator.of(context).pop();
              }),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
