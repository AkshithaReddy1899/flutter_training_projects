import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import '../models/tasks.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                ),
              ),
              TextField(
                controller: TextEditingController(),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              TextButton(
                onPressed: () {
                  Task newTask = Task(name: newTaskTitle, isDone: false);
                  Provider.of<TaskData>(context, listen: false)
                      .addNewTask(newTask);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
