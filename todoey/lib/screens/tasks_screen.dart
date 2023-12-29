import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_task_screen.dart';
import '../models/task_data.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
    TaskData defaultList = Provider.of<TaskData>(context, listen: false);
    defaultList.updateCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            //isScrollControlled: true,
            builder: (context) => const AddTaskScreen(),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Consumer<TaskData>(
        builder: (context, taskDataModel, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: Icon(
                      Icons.list,
                      size: 20.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Total number of tasks : ${taskDataModel.taskList.length.toString()}',
                    style: const TextStyle(fontSize: 20.0, height: 1.5),
                  ),
                  Text(
                    'Total number of tasks done : ${taskDataModel.tasksDoneCounter.toString()}',
                    style: const TextStyle(fontSize: 20.0, height: 1.5),
                  ),
                  Text(
                    'Total number of tasks pending : ${taskDataModel.pendingTasks.toString()}',
                    style: const TextStyle(fontSize: 20.0, height: 1.5),
                  ),
                  const Text(
                    '12 Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 300.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: const TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
