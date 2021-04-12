import 'package:afazeres/provider/newTodo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './actions.dart';

class NewPage extends StatefulWidget {
  final String label;
  final Function onNext;
  final Function onCancel;

  const NewPage({Key key, this.label, this.onNext, this.onCancel})
      : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  TextEditingController _controller;
  void next() => widget.onNext(_controller.text);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = new TextEditingController(
        text:
            Provider.of<NewTodoController>(context, listen: false).description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(widget.label,
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  style: Theme.of(context).textTheme.headline2,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Spacer(),
              ActionsNew(
                onNext: next,
                onCancel: widget.onCancel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
