class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffeldAnswers() {
    final shuffeldList = List.of(answers);
    shuffeldList.shuffle();//ne retourne pas la nouvelle list misa à jr juste elle la change
    return shuffeldList;
  }
}
