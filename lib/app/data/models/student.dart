class Student {
  String? id;
  String name;
  int? numOfCorrect;
  int? numOfWrong;
  String? imageAvartaUrl;

  Student(
      {this.id,
      required this.name,
      this.numOfCorrect,
      this.numOfWrong,
      this.imageAvartaUrl}) {
    id ??= DateTime.now.toString();
    numOfCorrect ??= 0;
    numOfWrong ??= 0;
  }
}
