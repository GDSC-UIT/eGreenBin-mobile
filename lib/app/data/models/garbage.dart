class Garbage {
  String? id; // id of trash
  String idStudent; // id of student threw trash
  DateTime? dateCreate; // date create of comment
  bool isRight; // true: right, false: Wrong

  Garbage({
    this.id,
    required this.idStudent,
    this.dateCreate,
    required this.isRight,
  }) {
    id ??= DateTime.now().toString();
    dateCreate ??= DateTime.now();
  }

  //fetch garbage from json
  factory Garbage.fromJson(Map<String, dynamic> json) {
    return Garbage(
      id: json['id'],
      idStudent: json['studentID'],
      isRight: json['isRight'],
      dateCreate: json['dateThrow'],
    );
  }
}
