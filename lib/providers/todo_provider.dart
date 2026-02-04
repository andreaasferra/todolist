import 'package:flutter/material.dart';
import '../models/todo_item.dart';
import '../models/todo_list.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoList> _lists = [
    TodoList(name: "Default")
  ];

  int selectedListIndex = 0;

  TodoList get currentList => _lists[selectedListIndex];
  List<TodoList> get lists => _lists;

  void addTask(String title) {
    currentList.items.add(TodoItem(title: title));
    notifyListeners();
  }

  void toggleTask(int index) {
    currentList.items[index].completed =
        !currentList.items[index].completed;
    notifyListeners();
  }

  void addList(String name) {
    _lists.add(TodoList(name: name));
    notifyListeners();
  }

  void changeList(int index) {
    selectedListIndex = index;
    notifyListeners();
  }

  // STATISTICHE
  int get totalTasks =>
      _lists.fold(0, (sum, list) => sum + list.items.length);

  int get completedTasks =>
      _lists.fold(0, (sum, list) =>
          sum + list.items.where((i) => i.completed).length);

  int get pendingTasks => totalTasks - completedTasks;

  double get efficiency =>
      totalTasks == 0 ? 0 : (completedTasks / totalTasks) * 100;
}
