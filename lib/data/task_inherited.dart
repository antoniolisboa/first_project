import 'package:flutter/material.dart';
import 'package:first_project/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task(
      taskName: 'Aprender Flutter',
      image: 'assets/images/bird.png',
      difficulty: 3,
    ),
    Task(
      taskName: 'Andar de Bike',
      image: 'assets/images/bike.jpg',
      difficulty: 2,
    ),
    Task(
      taskName: 'Meditar',
      image: 'assets/images/meditation.jpeg',
      difficulty: 1,
    ),
    Task(
      taskName: 'Ler',
      image: 'assets/images/book.jpg',
      difficulty: 3,
    ),
    Task(
      taskName: 'Jogar',
      image: 'assets/images/gamer.jpg',
      difficulty: 0,
    ),
  ];

  void newTask(
      {required String taskName,
      required String image,
      required int difficulty}) {
    taskList.add(
      Task(
        taskName: taskName,
        image: image,
        difficulty: difficulty,
      ),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
