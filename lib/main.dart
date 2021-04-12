import 'package:afazeres/provider/newTodo.dart';
import 'package:afazeres/provider/todo.dart';
import 'package:afazeres/views/new/index.dart';
import 'package:afazeres/views/new/selectDate.dart';
import 'package:afazeres/views/new/selectTime.dart';
import 'package:afazeres/views/new/success.dart';
import 'package:afazeres/views/todo/complete.dart';
import 'package:afazeres/views/todo/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './views/home/index.dart';
import './configuration/theme.dart';
import 'configuration/transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewTodoController()),
        ChangeNotifierProvider.value(value: TodoItemsController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Afazeres',
        theme: getTheme(textTheme),
        home: HomePage(),
        routes: {
          '/home': (ctx) => HomePage(),
          // '/new': (ctx) => WhatWillYouDo(),
          // '/new/selectDate': (ctx) => SelectDate(),
          // '/new/selectTime': (ctx) => SelectTime(),
        },
        onGenerateRoute: (settings) {
          print(settings.name);
          switch (settings.name) {
            case "/new":
              return slidePageTransition(WhatWillYouDo());
            case "/new/selectDate":
              return slidePageTransition(SelectDate());
            case "/new/selectTime":
              return slidePageTransition(SelectTime());
            case "/new/completed":
              return slidePageTransition(TodoNewCompleted());
            case "/todo":
              return slideUpPageTransition(
                  TodoItem(settings.arguments as String));
            case "/todo/completed":
              return slidePageTransition(TodoItemCompleted());
            default:
              return MaterialPageRoute(builder: (context) => Container());
          }
          // unknown route
        },
      ),
    );
  }
}
