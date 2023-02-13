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
            Task(
              taskName: 'Aprender Flutter',
              image:
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
            ),
            Task(
              taskName: 'Andar de Bike',
              image:
                  'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
            ),
            Task(
              taskName: 'Meditar',
              image:
                  'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
            ),
            Task(
              taskName: 'Ler',
              image:
                  'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
            ),
            Task(
              taskName: 'Jogar',
              image: 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
            ),
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

class Task extends StatefulWidget {
  final String taskName;
  final String image;

  const Task({
    required this.taskName,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

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
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
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
                            topLeft: Radius.circular(5),
                          ),
                        ),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            level++;
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
                            value: level / 10, // interval 0 -- 1
                            color: Colors.black54,
                            backgroundColor: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Level $level',
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
}
