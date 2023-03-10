import 'package:first_project/components/task.dart';
import 'package:first_project/data/task_inherited.dart';
import 'package:flutter/material.dart';

class UserLevel extends StatefulWidget {
  const UserLevel({Key? key}) : super(key: key);

  @override
  State<UserLevel> createState() => _UserLevelState();
}

class _UserLevelState extends State<UserLevel> {
  double _userLevel() {
    double level = 0;
    // double maxLevel = 0;

    for (Task task in TaskInherited.of(context).taskList) {
      level += (task.level/10) * task.difficulty;
      // maxLevel += (task.difficulty * 10);
    }

    return level;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black54,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.black54,
                ),
                Text(
                  'Level ${_userLevel().toInt()}',
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
            SizedBox(
              width: 230,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: _userLevel() / 100,
                  color: Colors.black54,
                  backgroundColor: Colors.black12,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {

                });
              },
              icon: const Icon(
                Icons.cached,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
