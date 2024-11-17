import 'package:flutter/material.dart';
import '../utils/storage.dart';

class ResultsHistoryScreen extends StatefulWidget {
  const ResultsHistoryScreen({super.key});
  
  @override
  State<ResultsHistoryScreen> createState() => _ResultsHistoryScreenState();
}

class _ResultsHistoryScreenState extends State<ResultsHistoryScreen> {
  List<String> results = [];

  Future<void> _loadResults() async {
    List<String> loadedResults = await loadResults();
    setState(() {
      results = loadedResults;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results History')),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Quiz ${index + 1}: ${results[index]}'),
          );
        },
      ),
    );
  }
}
