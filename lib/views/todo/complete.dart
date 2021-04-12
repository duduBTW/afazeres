import 'package:afazeres/views/new/components/actions.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class TodoItemCompleted extends StatelessWidget {
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
                "Task Completed",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Spacer(),
            Center(child: Image.asset("assets/jampu.gif", height: 260)),
            Spacer(),
            Container(
              child: ActionItem.center("BACK TO HOME", () {
                Navigator.of(context).pop();
              }),
              width: double.infinity,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
