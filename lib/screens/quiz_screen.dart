import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> args = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    final int correctAnswers = args['correctAnswers']!;
    final int totalQuestions = args['totalQuestions']!;

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You scored $correctAnswers out of $totalQuestions', style: const TextStyle(fontSize: 24.0)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: const Text('View Results History'),
            ),
          ],
        ),
      ),
    );
  }
}
