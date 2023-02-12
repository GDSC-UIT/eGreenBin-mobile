class Teacher {
  String id; // id of teacher
  String name; // name of teacher
  String? imageAvatarUrl; // link url image avatar of teacher

  Teacher({
    required this.id,
    required this.name,
    this.imageAvatarUrl,
  });

  //fetch teacher from json
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
      imageAvatarUrl: json['imageAvatarUrl'],
    );
  }
}
