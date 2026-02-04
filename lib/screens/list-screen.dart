import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class ListScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.currentList.name),
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () =>
                Navigator.pushNamed(context, '/stats'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: provider.currentList.items.length,
        itemBuilder: (context, index) {
          final item = provider.currentList.items[index];
          return CheckboxListTile(
            title: Text(
              item.title,
              style: TextStyle(
                decoration: item.completed
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            value: item.completed,
            onChanged: (_) => provider.toggleTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Nuovo Task"),
              content: TextField(controller: controller),
              actions: [
                TextButton(
                  onPressed: () {
                    provider.addTask(controller.text);
                    controller.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Aggiungi"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
