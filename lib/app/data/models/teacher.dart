class Teacher {
  String? id;
  String name;
  String mgv;
  String? imageAvatarUrl;

  Teacher({
    this.id,
    required this.name,
    required this.mgv,
    this.imageAvatarUrl,
  });
}
