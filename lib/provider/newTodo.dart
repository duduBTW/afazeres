import 'package:flutter/material.dart';

class NewTodoController extends ChangeNotifier {
  String _description = "";
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  set description(String newValue) {
    _description = newValue;
    notifyListeners();
  }

  set date(DateTime newValue) {
    if (newValue != _date) {
      _date = newValue;
      notifyListeners();
    }
  }

  set time(TimeOfDay newValue) {
    if (newValue != _time) {
      _time = newValue;
      notifyListeners();
    }
  }

  void clean() {
    _description = "";
    _date = DateTime.now();
    _time = TimeOfDay.now();
  }

  String get description => _description;
  DateTime get date => _date;
  TimeOfDay get time => _time;
}
