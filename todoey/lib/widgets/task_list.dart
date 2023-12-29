import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskDataModel, child) => Center(
        child: ListView.builder(
          itemCount: taskDataModel.taskList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              child: ListTile(
                onLongPress: () {
                  taskDataModel.deleteTask(taskDataModel.taskList[index]);
                },
                title: Text(
                  taskDataModel.taskList[index].name,
                  style: TextStyle(
                      decoration: taskDataModel.taskList[index].isDone
                          ? TextDecoration.lineThrough
                          : null),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: taskDataModel.taskList[index].isDone,
                  onChanged: (bool? value) {
                    taskDataModel.updateTask(taskDataModel.taskList[index]);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
