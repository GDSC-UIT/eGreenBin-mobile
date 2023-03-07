class Teacher {
  String? id; // id of teacher
  String name; // name of teacher
  String? code;
  String? imageAvatarUrl; // link url image avatar of teacher

  Teacher({
    this.id,
    this.code,
    required this.name,
    this.imageAvatarUrl,
  });

  //fetch teacher from json
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      imageAvatarUrl: json['imageAvatarUrl'],
    );
  }
}
