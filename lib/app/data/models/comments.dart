import 'comment.dart';

class Comments {
  List<Comment> listCommentsFindById(String id) {
    List<Comment> list = [];
    listAllCommets.forEach((com) {
      if (com.idStudent == id) list.add(com);
    });
    return list;
  }

  List<Comment> listAllCommets = [
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      date: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      date: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      date: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      date: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522321",
      content:
          "Bé Quynh đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      date: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522321",
      content:
          "Bé Quynh vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      date: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522321",
      content:
          "Bé Quynh đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      date: DateTime(2022, 11, 12),
    ),
  ];
}
