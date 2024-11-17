class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  const Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}


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