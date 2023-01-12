class Student {
  // them thong tin email phu huynh
  String? id;
  String name;
  int? numOfCorrect;
  int? numOfWrong;
  String? imageAvartaUrl;
  String? parentEmail;

  Student({
    this.id,
    required this.name,
    this.numOfCorrect,
    this.numOfWrong,
    this.imageAvartaUrl,
    this.parentEmail,
  }) {
    id ??= DateTime.now.toString();
    numOfCorrect ??= 0;
    numOfWrong ??= 0;
    parentEmail ??= "phanvanminh1234567890@gmail.com";
  }
}
