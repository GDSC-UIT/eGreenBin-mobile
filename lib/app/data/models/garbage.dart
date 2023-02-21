class Garbage {
  String? id; // id of trash
  String idStudent; // id of student threw trash
  DateTime? dateCreate; // date create of comment
  int? week;
  bool isRight; // true: right, false: Wrong

  Garbage({
    this.id,
    required this.idStudent,
    this.dateCreate,
    this.week,
    required this.isRight,
  }) {
    id ??= DateTime.now().toString();
    dateCreate ??= DateTime.now();
    week ??= 1;
  }

  //fetch garbage from json
  factory Garbage.fromJson(Map<String, dynamic> json) {
    return Garbage(
      id: json['id'],
      idStudent: json['idStudent'],
      isRight: json['isRight'],
      week: json['week'],
      dateCreate: json['dateCreate'],
    );
  }
}
