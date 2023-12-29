import 'package:flutter/cupertino.dart';

import './tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [
    Task(name: 'Buy milk', isDone: true),
    Task(name: 'Buy bread', isDone: false),
  ];

  int tasksDoneCounter = 0;
  int pendingTasks = 0;

  updateCounter() {
    for (var element in taskList) {
      if (element.isDone == true) {
        tasksDoneCounter++;
      } else {
        pendingTasks++;
      }
    }
    notifyListeners();
  }

  void addNewTask(Task newTask) {
    taskList.add(newTask);
    updateCounters();
    notifyListeners();
  }

  updateTask(Task task) {
    task.toggleDone();
    updateCounters();
    notifyListeners();
  }

  deleteTask(Task task) {
    taskList.remove(task);
    updateCounters();
    notifyListeners();
  }

  updateCounters() {
    tasksDoneCounter = 0;
    pendingTasks = 0;
    updateCounter();
  }
}
