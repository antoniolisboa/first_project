import 'package:flutter/material.dart';
import 'package:first_project/components/difficulty.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String image;
  final int difficulty;
  int level = 0;

  Task({
    this.level = 0,
    required this.taskName,
    required this.image,
    required this.difficulty,
    Key? key,
  }) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<Color> masteryColors = [
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.black38,
  ];
  Color taskColor = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: taskColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 75,
                        decoration: const BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.image,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.image,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.taskName,
                              style: const TextStyle(
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Difficulty(difficultyLevel: widget.difficulty),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (widget.level == (widget.difficulty * 10)) {
                                selectMasteryColor(color: taskColor);
                                if (taskColor != Colors.black) {
                                  widget.level = 0;
                                }
                              } else {
                                widget.level++;
                              }
                            });
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.greenAccent,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_drop_up,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 250,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          ),
                          child: LinearProgressIndicator(
                            value: (widget.difficulty != 0)
                                ? widget.level / (10 * widget.difficulty)
                                : 1, // interval 0 -- 1
                            color: Colors.black54,
                            backgroundColor: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Level ${widget.level}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool assetOrNetwork() {
    if (widget.image.contains('http')) {
      return false;
    }

    return true;
  }

  void selectMasteryColor({required Color color}) {
    if (taskColor != Colors.black) {
      taskColor = masteryColors.elementAt(
        masteryColors.indexOf(taskColor) + 1,
      );
    }
  }
}
