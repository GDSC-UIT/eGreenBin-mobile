class Teacher {
  String id; // id of teacher
  String name; // name of teacher
  String? imageAvatarUrl; // link url image avatar of teacher

  Teacher({
    required this.id,
    required this.name,
    this.imageAvatarUrl,
  });
}
