import 'package:afazeres/provider/newTodo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/item.dart';

class WhatWillYouDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewPage(
      label: "What will you do?",
      onCancel: () => Navigator.of(context).pop(),
      onNext: (String newValue) {
        Navigator.of(context).pushNamed("/new/selectDate");
        Provider.of<NewTodoController>(context, listen: false).description =
            newValue;
      },
    );
  }
}
