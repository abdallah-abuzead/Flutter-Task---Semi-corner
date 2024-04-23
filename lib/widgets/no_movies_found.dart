import 'package:flutter/material.dart';

class NoMoviesFound extends StatelessWidget {
  const NoMoviesFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            size: 70,
            color: Colors.grey,
          ),
          Text(
            "No Movies Found",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
