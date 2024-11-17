import 'package:flutter/material.dart';
import './result_history_screen.dart';

class ResultsScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const ResultsScreen({super.key, required this.correctAnswers, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You scored $correctAnswers out of $totalQuestions', style: const TextStyle(fontSize: 24.0)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultsHistoryScreen()),
                );
              },
              child: const Text('View Results History'),
            ),
          ],
        ),
      ),
    );
  }
}
