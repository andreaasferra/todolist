import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Statistiche")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Task totali: ${provider.totalTasks}"),
            Text("Task completati: ${provider.completedTasks}"),
            Text("Task da svolgere: ${provider.pendingTasks}"),
            SizedBox(height: 20),
            Text(
              "Efficienza: ${provider.efficiency.toStringAsFixed(1)}%",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
