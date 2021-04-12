import 'dart:math';

import 'package:afazeres/provider/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/header.dart';
import 'components/list/listAfazeres.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Tween<double> _slideTween = Tween<double>(begin: -300, end: 0);
  List<String> images = ["comfy1.gif", "comfy2.jpg", "comfy3.jpg"];

  int min = 0;
  int max = 3;
  int r = 0;

  @override
  void initState() {
    var rnd = new Random();
    setState(() {
      r = min + rnd.nextInt(max - min);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listTodos =
        Provider.of<TodoItemsController>(context, listen: true).todos;

    var afazeres = [
      HeaderHome(item: listTodos.length > 0 ? listTodos[0] : null),
      Spacer(
        flex: 1,
      ),
      if (listTodos.length > 1) ListAfazeresHome(listTodos: listTodos),
    ];

    var comfy = [
      TweenAnimationBuilder(
        curve: Curves.bounceOut,
        tween: _slideTween,
        duration: Duration(milliseconds: 1000),
        builder: (ctx, slide, child) {
          return Transform.translate(
            offset: Offset(slide, 0),
            child: child,
          );
        },
        child: Center(
            child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: AssetImage("assets/${images[r]}"), fit: BoxFit.cover)),
        )
            //  ClipRRect(
            //     child: Image.asset("assets/${images[0]}", width: 275),
            //     borderRadius: BorderRadius.circular(10.0)),
            ),
      ),
      SizedBox(
        height: 100,
      ),
      Text("Get comfy", style: Theme.of(context).textTheme.headline3),
      SizedBox(
        height: 10,
      ),
      Text("You don't have anything for today",
          style: Theme.of(context).textTheme.bodyText1),
      Spacer(
        flex: 1,
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            if (listTodos.length <= 0)
              Image.asset(
                "assets/background.png",
              ),
            LimitedBox(
              maxHeight: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  if (listTodos.length > 0) ...afazeres,
                  if (listTodos.length <= 0) ...comfy,
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(60),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/new");
                        },
                        child: Text(
                          "NEW",
                          style: Theme.of(context).textTheme.button,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
