class Comment {
  String? id;
  String idStudent;
  String content;
  DateTime? date;

  Comment({
    this.id,
    required this.idStudent,
    required this.content,
    this.date,
  }) {
    id ??= DateTime.now().toString();
    date ??= DateTime.now();
  }
}
