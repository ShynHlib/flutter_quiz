import 'package:flutter/material.dart';
import 'package:flutter_quiz/utils/storage.dart';
import 'models/question.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuestionScreen(title: 'Quiz'),
    );
  }
}

class QuestionScreen extends StatefulWidget {

  const QuestionScreen({super.key, required this.title});

  final String title;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int selectedOptionIndex = -1;
  String? selectedOption;

  final PageController _pageController = PageController();


  final List<Question> questions = [
    const Question(
      questionText: 'What is the capital of France?',
      options: ['Berlin', 'Madrid', 'Paris', 'Rome'],
      correctOptionIndex: 2,
    ),
    const Question(
      questionText: '2+2 equals',
      options: ['5', 'five', '4', '8'],
      correctOptionIndex: 2,
    ),
    const Question(
      questionText: 'Which continent is Australia located on?',
      options: ['America', 'Eurasia', 'Ukraine', 'Australia'],
      correctOptionIndex: 3,
    ),
    const Question(
      questionText: 'What is the largest ocean on Earth?',
      options: ['Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean'],
      correctOptionIndex: 0,
    ),
    const Question(
      questionText: 'What is the largest country in the world by area?',
      options: ['United States', 'Canada', 'China', 'Russia'],
      correctOptionIndex: 3,
    ),
  ];

  void _submitButton(String? selectedOption) {
    List<String> currentQuestionsOptions = questions[currentQuestionIndex].options;

    int selectedOptionIndex = currentQuestionsOptions.indexWhere((item) => item == selectedOption);


    if (selectedOptionIndex == questions[currentQuestionIndex].correctOptionIndex) {
      correctAnswers++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    } else {
      saveResult(correctAnswers, questions.length);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(correctAnswers: correctAnswers, totalQuestions: questions.length),
        ),
      );
     }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            questions[currentQuestionIndex].questionText,
            style: const TextStyle(fontSize: 24.0),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ...questions[index].options.asMap().entries.map((entry) {
                    String option = entry.value;
                    return ListTile(
                      //contentPadding: const EdgeInsets.only(left: 100.0),
                      title: Text(option),
                      leading: Radio(
                        value: option,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState((){
                            selectedOption = value.toString();
                          });
                        }
                      ),
                    );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(onPressed: () => _submitButton(selectedOption), child: const Text('Submit')),
                    ),
                  ]
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
