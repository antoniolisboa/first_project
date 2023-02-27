import 'package:flutter/material.dart';
import 'package:first_project/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOpacity = true;
  IconData visibilityIcon = Icons.visibility_outlined;

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
          child: ListView(
            children: const [
              Task(
                taskName: 'Aprender Flutter',
                image:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                difficulty: 3,
              ),
              Task(
                taskName: 'Andar de Bike',
                image:
                    'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                difficulty: 2,
              ),
              Task(
                taskName: 'Meditar',
                image:
                    'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                difficulty: 1,
              ),
              Task(
                taskName: 'Ler',
                image:
                    'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                difficulty: 3,
              ),
              Task(
                taskName: 'Jogar',
                image:
                    'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
                difficulty: 0,
              ),
              SizedBox(
                height: 75,
              )
            ],
          ),
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

  void visibilityOnOff() {
    setState(() {
      isOpacity = !isOpacity;
      visibilityIcon =
          isOpacity ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    });
  }
}
