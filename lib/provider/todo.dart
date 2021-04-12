import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoItemsModel {
  String id;
  String description = "";
  String comment = "";
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  TodoItemsModel({this.description, this.date, this.time, this.id});
}

class TodoItemsController extends ChangeNotifier {
  List<TodoItemsModel> _todos = [];

  void addTodo(TodoItemsModel newTodo) {
    newTodo.id = Uuid().v4();
    _todos.add(newTodo);
    notifyListeners();
  }

  TodoItemsModel todo(String id) {
    return _todos.firstWhere((item) => item.id == id, orElse: () => null);
  }

  void editComment(String id, String newComment) {
    final index = _todos.indexWhere((item) => item.id == id);
    var newItem = _todos.firstWhere((item) => item.id == id);

    newItem.comment = newComment;
    _todos[index] = newItem;
    notifyListeners();
  }

  void remove(String id) {
    _todos.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  List<TodoItemsModel> get todos => _todos;
}
