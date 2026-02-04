import 'todo_item.dart';

class TodoList {
  String name;
  List<TodoItem> items;

  TodoList({
    required this.name,
    List<TodoItem>? items,
  }) : items = items ?? [];
}
