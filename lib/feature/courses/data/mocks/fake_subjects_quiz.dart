import 'package:LASYLAB/feature/courses/data/models/response/quiz_response.dart';
import 'package:LASYLAB/feature/courses/data/models/response/subject_quiz.dart';

List<String> scienceQuestions = [
  'What is the powerhouse of the cell?',
  'What is the chemical symbol for gold?',
  'Which planet is known as the Red Planet?',
  'What is the largest bone in the human body?',
  'What is the freezing point of water in Celsius?',
];

List<List<String>> options = [
  ['Mitochondria', 'Ribosome', 'Nucleus', 'Endoplasmic reticulum'],
  ['Au', 'Ag', 'Fe', 'Cu'],
  ['Mars', 'Venus', 'Jupiter', 'Mercury'],
  ['Femur', 'Tibia', 'Fibula', 'Humerus'],
  ['-5°C', '0°C', '10°C', '100°C'],
];

List<String> correctAnswers = ['Mitochondria', 'Au', 'Mars', 'Femur', '0°C'];

List<SubjectQuiz> fakeSubjectQuizzes = List.generate(5, (index) {
  return SubjectQuiz(
    video:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    quizs: List.generate(5, (quizIndex) {
      return QuizResponse(
        title: 'Science Question ${quizIndex + 1}',
        correctAnswer: correctAnswers[quizIndex],
        proposition: options[quizIndex],
      );
    }),
  );
});
