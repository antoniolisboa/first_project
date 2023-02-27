import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 1)
              ? Colors.greenAccent
              : Colors.greenAccent[100],
        ),
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 2)
              ? Colors.greenAccent
              : Colors.greenAccent[100],
        ),
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 3)
              ? Colors.greenAccent
              : Colors.greenAccent[100],
        ),
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 4)
              ? Colors.greenAccent
              : Colors.greenAccent[100],
        ),
        Icon(
          Icons.star,
          size: 16,
          color: (difficultyLevel >= 5)
              ? Colors.greenAccent
              : Colors.greenAccent[100],
        ),
      ],
    );
  }
}