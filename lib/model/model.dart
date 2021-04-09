class Question {
  final String question;
  final bool answer;

  Question({this.question, this.answer});
}

class QuizzBrain {
  int _nextNumber = 0;

  List _questionBank = [
    Question(
        question: 'Some cats are actually allergic to humans', answer: true),
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true),
    Question(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    Question(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
    Question(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    Question(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    Question(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    Question(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    Question(
        question: 'Google was originally called \"Backrub\".', answer: true),
    Question(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    Question(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

  void nextQuestion() {
    if (_nextNumber < _questionBank.length - 1) {
      _nextNumber++;
    }
  }

  void reset() {
    if (isFinished() == true) {
      _nextNumber = 0;
    }
  }

  String getQuestions() {
    return _questionBank[_nextNumber].question;
  }

  bool correctAnswer() {
    return _questionBank[_nextNumber].answer;
  }

  bool isFinished() {
    // bool late;
    return _nextNumber >= 12;
  }
}
