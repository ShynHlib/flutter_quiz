import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveResult(int correctAnswers, int totalQuestions) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? results = prefs.getStringList('results') ?? [];
  results.add('$correctAnswers/$totalQuestions');
  await prefs.setStringList('results', results);
}

Future<List<String>> loadResults() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('results') ?? [];
}
