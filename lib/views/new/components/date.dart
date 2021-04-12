import 'package:afazeres/provider/newTodo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './actions.dart';
import 'package:intl/intl.dart';

class NewPageDate extends StatefulWidget {
  final String label;
  final Function onNext;
  final Function onCancel;

  const NewPageDate({Key key, this.label, this.onNext, this.onCancel})
      : super(key: key);

  @override
  _NewPageDateState createState() => _NewPageDateState();
}

class _NewPageDateState extends State<NewPageDate> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: Provider.of<NewTodoController>(context, listen: false).date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.white,
            accentColor: Colors.white,
            colorScheme: ColorScheme.light(primary: Colors.black),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
    if (picked != null)
      Provider.of<NewTodoController>(context, listen: false).date = picked;
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
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                      DateFormat("dd/MM/yyyy").format(
                          Provider.of<NewTodoController>(context, listen: true)
                              .date),
                      style: Theme.of(context).textTheme.headline2),
                ),
              ),
              Spacer(),
              ActionsNew(
                onNext: widget.onNext,
                onCancel: widget.onCancel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
