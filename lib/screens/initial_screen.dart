import 'package:flutter/material.dart';
import 'package:first_project/components/task.dart';

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
    return Scaffold(
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
