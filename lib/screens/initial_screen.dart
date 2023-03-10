import 'package:first_project/components/user_level.dart';
import 'package:first_project/data/task_inherited.dart';
import 'package:first_project/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isOpacity = true;
  IconData visibilityIcon = Icons.visibility_outlined;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: visibilityOnOff,
                  icon: Icon(
                    visibilityIcon,
                    color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
          body: AnimatedOpacity(
            opacity: isOpacity ? 1 : 0,
            duration: const Duration(
              milliseconds: 800,
            ),
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.only(top: 65, bottom: 70),
                  children: TaskInherited.of(context).taskList,
                ),
                const UserLevel(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.greenAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (newContext) => FormScreen(
                    taskContext: context,
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.black54,
            ),
          ),
          // bottomNavigationBar: BottomAppBar(
          //   color: Colors.amberAccent,
          //   height: 50,
          //   child:
          // ),
        ),

      ],
    );
  }

  void visibilityOnOff() {
    setState(() {
      isOpacity = !isOpacity;
      visibilityIcon =
          isOpacity ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    });
  }
}
