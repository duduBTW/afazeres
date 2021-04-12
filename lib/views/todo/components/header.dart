import 'package:flutter/material.dart';

class HeaderTodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: IconButton(
          icon: Icon(
            Icons.close_sharp,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop()),
    );
  }
}
