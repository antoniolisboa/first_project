import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: const Icon(
            Icons.list_alt,
            color: Colors.black54,
            size: 32,
          ),
          title: const Text(
            'Tasks',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 22,
            ),
          ),
        ),
        body: ListView(
          children: const [
            Task(taskName: 'Learning Flutter',),
            Task(taskName: 'Learning English',),
            Task(taskName: 'Learning English',),
            Task(taskName: 'Learning English',),
            Task(taskName: 'Learning English',),
            Task(taskName: 'Learning English',),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String taskName;

  const Task({required this.taskName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            color: Colors.greenAccent,
            height: 140,
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  height: 100,
                  width: 75,
                ),
                Text(taskName),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.greenAccent,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

